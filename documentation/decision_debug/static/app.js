"use strict";

// ── State ──────────────────────────────────────────────────────────
let CRITERIA = { active: [], dormant: [] }; // from /api/criteria
const weightInputs = new Map(); // name -> <input range>
const baseWeights = new Map(); // name -> base weight
const baseStates = new Map(); // name -> spec state (active | dormant | excluded)
const targetInputs = new Map(); // name -> <input number> (target-direction only)
const dontCare = new Set(); // names the user marked DON'T CARE (state=excluded)

const WEIGHT_MAX = 0.5;
const WEIGHT_STEP = 0.005;
// Default activation weight the engine gives a dormant criterion when a target
// is set (decision_model/preferences._apply_set_target).
const DEFAULT_TARGET_WEIGHT = 0.05;


// Monte Carlo control definitions (key, label, min, max, step | options)
const MC_SLIDERS = [
    { key: "n_samples", label: "Samples", min: 500, max: 20000, step: 500, int: true },
    { key: "weight_perturbation", label: "Weight perturbation", min: 0, max: 1, step: 0.05 },
    { key: "vikor_v", label: "VIKOR v", min: 0, max: 1, step: 0.05 },
    { key: "dormant_budget", label: "Dormant budget", min: 0, max: 1, step: 0.05 },
];

// One-line explanation per Monte Carlo engine parameter (shown by the "i" button).
const MC_HELP = {
    n_samples:
        "Number of Monte Carlo iterations. Each draws a random weight vector and " +
        "random attribute values, runs VIKOR, and records the ranking. More " +
        "samples → smoother, more stable probabilities (P(rank 1), HAI) but slower.",
    weight_perturbation:
        "How far the sampled criterion weights wander around the weights you set " +
        "(0–1). 0 = weights fixed exactly as set; higher = wider Dirichlet spread, " +
        'exploring "what if the weights were somewhat different". Drives the ' +
        "weight-robustness of the ranking.",
    vikor_v:
        "VIKOR compromise parameter v (0–1). Balances group utility S (average " +
        "weighted performance) against individual regret R (worst single-criterion " +
        "gap). v=1 → pure utility / majority rule; v=0 → minimise the worst " +
        "criterion; 0.5 = balanced compromise.",
    dormant_budget:
        "Caps the total weight share given to dormant criteria (weight 0). Each " +
        "iteration a fraction is drawn Uniform(0, budget) and split uniformly " +
        "among the dormant criteria, while the active criteria share the rest. " +
        "Dormant target criteria are scored against a latent target drawn each " +
        "iteration from Uniform(range_min, range_max), so no preference direction " +
        "is assumed. This makes unexpressed preferences widen rank uncertainty: " +
        "confidence starts softer and tightens as criteria are activated. " +
        "Production runs with the configured budget (default 0.2); set 0 to make " +
        "dormant criteria zero-weight and inert. " +
        "Note: it does NOT drive the follow-up/discovery questions — those sweep " +
        "candidate targets deterministically, regardless of this budget.",
    random_seed:
        "Seed for the RNG. Same seed + same inputs = identical results " +
        "(reproducible). Change it to see sampling noise and check stability.",
};
const mcInputs = new Map();

// ── Boot ───────────────────────────────────────────────────────────
async function boot() {
    const res = await fetch("/api/criteria");
    const data = await res.json();
    CRITERIA = data;

    document.getElementById("alt-count").textContent =
        `${data.n_alternatives} alternatives, ` +
        `${data.active.length + data.dormant.length} criteria`;
    document.getElementById("dormant-count").textContent =
        `(${data.dormant.length})`;

    buildSliders(data.active, document.getElementById("active-sliders"), false);
    buildSliders(data.dormant, document.getElementById("dormant-sliders"), true);
    buildMcControls(data.mc_defaults);
    refreshPercentages();

    document.getElementById("btn-run").addEventListener("click", runModel);
    document.getElementById("btn-reset").addEventListener("click", resetWeights);

    // Info "i" buttons toggle the element named by data-target.
    document.addEventListener("click", (e) => {
        const btn = e.target.closest(".info-btn");
        if (!btn) return;
        const el = document.getElementById(btn.dataset.target);
        if (el) {
            el.hidden = !el.hidden;
            btn.classList.toggle("open", !el.hidden);
        }
    });
}

function buildSliders(list, container, isDormant) {
    container.innerHTML = "";
    for (const c of list) {
        baseWeights.set(c.name, c.weight);
        baseStates.set(c.name, c.state || (c.weight > 0 ? "active" : "dormant"));
        if (c.state === "excluded") dontCare.add(c.name);

        const row = document.createElement("div");
        row.className = "slider-row";
        row.dataset.name = c.name;

        const label = document.createElement("div");
        label.className = "label";
        label.innerHTML =
            `${escapeHtml(c.name)} <span class="dir">${c.direction || ""}</span>` +
            ` <span class="state-badge"></span>`;
        label.title = c.label;

        // Explicit DON'T-CARE toggle: excludes the criterion from ranking,
        // exploration, and questions (set_state state="excluded").
        const dcBtn = document.createElement("button");
        dcBtn.type = "button";
        dcBtn.className = "dontcare-btn";
        dcBtn.textContent = "don't care";
        dcBtn.title =
            "Mark as DON'T CARE — the criterion is excluded from the ranking, " +
            "dormant exploration, and discovery questions.";
        dcBtn.addEventListener("click", () => {
            if (dontCare.has(c.name)) {
                dontCare.delete(c.name);
            } else {
                dontCare.add(c.name);
            }
            updateRowReadout(c.name);
            refreshPercentages();
        });
        label.appendChild(dcBtn);

        const vals = document.createElement("div");
        vals.className = "vals";

        const range = document.createElement("input");
        range.type = "range";
        range.min = "0";
        range.max = String(WEIGHT_MAX);
        range.step = String(WEIGHT_STEP);
        range.value = String(c.weight);
        range.addEventListener("input", () => {
            updateRowReadout(c.name);
            refreshPercentages();
        });

        weightInputs.set(c.name, range);
        // Distribution curve sits on its own grid row, above the slider track.
        row.append(label, vals, buildDistSvg(), range);

        // Target-direction criteria get a target-value input. The criterion is
        // scored by closeness to this value; entering one activates it.
        if (c.direction === "target") {
            row.appendChild(buildTargetInput(c));
        }

        container.appendChild(row);
        updateRowReadout(c.name);
    }
}

// A target-value input row for a target-direction criterion. Default is unset
// (placeholder = range midpoint); the data model carries no preset target_value.
function buildTargetInput(c) {
    const wrap = document.createElement("div");
    wrap.className = "target-row";

    const lo = c.range_min;
    const hi = c.range_max;
    const mid =
        lo != null && hi != null ? (Number(lo) + Number(hi)) / 2 : null;

    const lab = document.createElement("span");
    lab.className = "target-label";
    lab.textContent = "target";

    const input = document.createElement("input");
    input.type = "number";
    input.className = "target-input";
    if (lo != null) input.min = String(lo);
    if (hi != null) input.max = String(hi);
    input.step = "any";
    if (c.target_value != null) input.value = String(c.target_value);
    if (mid != null) input.placeholder = `${trimNum(mid)} (mid)`;

    const rangeHint = document.createElement("span");
    rangeHint.className = "target-range";
    rangeHint.textContent =
        lo != null && hi != null ? `range ${trimNum(lo)}–${trimNum(hi)}` : "";

    input.addEventListener("input", () => {
        updateRowReadout(c.name);
        refreshPercentages();
    });

    targetInputs.set(c.name, input);
    wrap.append(lab, input, rangeHint);
    return wrap;
}

function trimNum(v) {
    return Number(v)
        .toFixed(2)
        .replace(/\.00$/, "")
        .replace(/(\.\d)0$/, "$1");
}

// Has the user entered a (numeric) target for this criterion?
function hasTarget(name) {
    const inp = targetInputs.get(name);
    if (!inp) return false;
    const v = inp.value.trim();
    return v !== "" && Number.isFinite(parseFloat(v));
}

// Weight the engine will effectively use: the slider value, but a target with a
// zero slider activates the criterion at DEFAULT_TARGET_WEIGHT (set_target).
// A DON'T-CARE criterion is excluded entirely, whatever its slider says.
function effectiveWeight(name) {
    if (dontCare.has(name)) return 0;
    const w = parseFloat(weightInputs.get(name).value);
    if (w > 0) return w;
    return hasTarget(name) ? DEFAULT_TARGET_WEIGHT : 0;
}

function updateRowReadout(name) {
    const range = weightInputs.get(name);
    const row = range.closest(".slider-row");
    const w = parseFloat(range.value);
    const base = baseWeights.get(name) ?? 0;
    const dcChanged = dontCare.has(name) !== (baseStates.get(name) === "excluded");
    row.classList.toggle(
        "changed",
        Math.abs(w - base) > 1e-9 || hasTarget(name) || dcChanged,
    );
    row.classList.toggle("excluded", dontCare.has(name));
    const dcBtn = row.querySelector(".dontcare-btn");
    if (dcBtn) dcBtn.classList.toggle("on", dontCare.has(name));
    // Show the effective weight (a target activates a 0-slider at 0.05).
    // %-share is filled in by refreshPercentages.
    const eff = effectiveWeight(name);
    const vals = row.querySelector(".vals");
    vals.dataset.weight = eff.toFixed(3);
    renderVals(vals, eff, vals.dataset.pct);

    const st = effectiveState(name);
    const badge = row.querySelector(".state-badge");
    if (badge) {
        badge.textContent = st;
        badge.className = `state-badge s-${st}`;
        badge.title =
            st === "dormant"
                ? "No preference expressed — explored only via the dormant budget; asks discovery questions."
                : st === "excluded"
                  ? "DON'T CARE — excluded from the ranking, dormant exploration, and questions."
                  : "Participates directly in the ranking with its weight.";
    }

    // Emphasize the target box once the criterion carries weight, so it's clear
    // the target value is actually in effect.
    const targetRow = targetInputs.get(name)?.closest(".target-row");
    if (targetRow) targetRow.classList.toggle("active", eff > 0);
}

// Resulting engine state of a criterion (explicit — mirrors the spec's `state`
// field). DON'T CARE → excluded (set_state); slider > 0 or a target value →
// active (set_weight / set_target); otherwise dormant.
function effectiveState(name) {
    if (dontCare.has(name)) return "excluded";
    return effectiveWeight(name) > 0 ? "active" : "dormant";
}

function renderVals(vals, w, pct) {
    vals.innerHTML =
        `w=${w.toFixed(3)}` + (pct ? `<span class="pct">${pct}</span>` : "");
}

// Live normalized share across ALL criteria with effective weight > 0.
function refreshPercentages() {
    let total = 0;
    for (const name of weightInputs.keys()) {
        total += effectiveWeight(name);
    }
    for (const [name, range] of weightInputs.entries()) {
        const w = effectiveWeight(name);
        const pct = total > 0 && w > 0 ? `${((w / total) * 100).toFixed(1)}%` : "—";
        const vals = range.closest(".slider-row").querySelector(".vals");
        vals.dataset.pct = pct;
        renderVals(vals, w, pct);
    }
    updateAllDistributions();
}

// ── Weight sampling-distribution curve ───────────────────────────────
// Each active criterion's weight is a component of the Dirichlet the engine
// samples (decision_model/joint_mc._sample_weights_hybrid). Its marginal is a
// Beta with mean = the criterion's normalized share and variance set by the
// concentration, which weight_perturbation drives. We draw a Gaussian bell with
// that mean/sd (the "or normal" view) so the on-screen width = the sampling
// spread, widening live as weight perturbation increases.
const SVGNS = "http://www.w3.org/2000/svg";
const VIZ_W = 100;
const VIZ_H = 22;

function buildDistSvg() {
    const svg = document.createElementNS(SVGNS, "svg");
    svg.setAttribute("class", "dist");
    svg.setAttribute("viewBox", `0 0 ${VIZ_W} ${VIZ_H}`);
    svg.setAttribute("preserveAspectRatio", "none");
    const fill = document.createElementNS(SVGNS, "path");
    fill.setAttribute("class", "dist-fill");
    const mean = document.createElementNS(SVGNS, "line");
    mean.setAttribute("class", "dist-mean");
    svg.append(fill, mean);
    return svg;
}

// Mean and sd of a criterion's sampled weight, mirroring the engine
// (decision_model/joint_mc._sample_weights_hybrid). Validated empirically
// against the real sampler to Monte-Carlo noise at all perturbation/budget
// values. The active weights are a Dirichlet block, optionally scaled by
// (1 - U), U ~ Uniform(0, dormant_budget), when dormant criteria are present.
function weightMarginal(name) {
    const cur = effectiveWeight(name);
    let totalActive = 0;
    let nActive = 0;
    for (const n of weightInputs.keys()) {
        const v = effectiveWeight(n);
        if (v > 0) {
            totalActive += v;
            nActive += 1;
        }
    }
    if (cur <= 0 || totalActive <= 0) return { mean: 0, sd: 0, active: false };

    const m = cur / totalActive; // Dirichlet component mean (active block)
    const p = parseFloat(mcInputs.get("weight_perturbation").el.value);
    const nDormant = weightInputs.size - nActive;

    // Dirichlet marginal: concentration = (1-p)*150 + 1, a0 = concentration * n.
    const conc = (1 - p) * 150 + 1;
    const a0 = conc * nActive;
    const varX = (m * (1 - m)) / (a0 + 1);
    const ex2 = varX + m * m; // E[X²]

    // Active block is scaled by Y = 1 - U, U ~ Uniform(0, budget), iff there are
    // dormant criteria and budget > 0. E[Y] = 1 - b/2, Var[Y] = b²/12.
    const b = parseFloat(mcInputs.get("dormant_budget").el.value);
    const scaled = nDormant > 0 && b > 0;
    const ey = scaled ? 1 - b / 2 : 1;
    const ey2 = scaled ? (b * b) / 12 + ey * ey : 1;

    const mean = m * ey;
    const variance = Math.max(0, ex2 * ey2 - mean * mean);
    return { mean, sd: Math.sqrt(variance), active: true };
}

function updateAllDistributions() {
    // Shared x-axis (from the means) so curves are comparable and the visible
    // width grows purely with perturbation, not the axis.
    let totalActive = 0;
    for (const n of weightInputs.keys()) {
        totalActive += effectiveWeight(n);
    }
    let maxMean = 0;
    if (totalActive > 0) {
        for (const n of weightInputs.keys()) {
            maxMean = Math.max(maxMean, effectiveWeight(n) / totalActive);
        }
    }
    const xmax = Math.min(1, Math.max(0.15, maxMean * 1.5 + 0.03));
    for (const name of weightInputs.keys()) drawDistribution(name, xmax);
}

function drawDistribution(name, xmax) {
    const row = weightInputs.get(name).closest(".slider-row");
    const svg = row.querySelector("svg.dist");
    if (!svg) return;
    const fill = svg.querySelector(".dist-fill");
    const line = svg.querySelector(".dist-mean");

    const { mean, sd, active } = weightMarginal(name);
    if (!active) {
        fill.setAttribute("d", "");
        line.setAttribute("x1", "-1");
        line.setAttribute("x2", "-1");
        return;
    }

    const top = 2;
    const base = VIZ_H - 1;
    const mx = Math.max(0, Math.min(VIZ_W, (mean / xmax) * VIZ_W));
    line.setAttribute("x1", mx.toFixed(2));
    line.setAttribute("x2", mx.toFixed(2));
    line.setAttribute("y1", String(top - 1));
    line.setAttribute("y2", String(base));

    if (sd <= 1e-6) {
        // Fixed weight: draw a thin spike at the mean.
        fill.setAttribute(
            "d",
            `M ${(mx - 0.8).toFixed(2)} ${base} L ${mx.toFixed(2)} ${top} ` +
                `L ${(mx + 0.8).toFixed(2)} ${base} Z`
        );
        return;
    }

    const N = 56;
    let d = `M 0 ${base}`;
    for (let i = 0; i <= N; i++) {
        const x = (i / N) * xmax;
        const y = Math.exp(-0.5 * ((x - mean) / sd) ** 2); // peak 1 at the mean
        const px = (x / xmax) * VIZ_W;
        const py = base - y * (base - top);
        d += ` L ${px.toFixed(2)} ${py.toFixed(2)}`;
    }
    d += ` L ${VIZ_W} ${base} Z`;
    fill.setAttribute("d", d);
}

// Build one MC control: a label (with an "i" info button), the control widgets,
// and a hidden help line that the info button toggles.
function mcControl(key, labelText, controlEls) {
    const container = document.createElement("div");
    container.className = "mc-control";

    const row = document.createElement("div");
    row.className = "mc-row";

    const label = document.createElement("div");
    label.className = "label";
    label.innerHTML =
        `${escapeHtml(labelText)} ` +
        `<button class="info-btn" type="button" data-target="help-${key}" ` +
        `title="What does ${escapeHtml(labelText)} do?">i</button>`;
    row.appendChild(label);
    for (const el of controlEls) row.appendChild(el);
    container.appendChild(row);

    const help = document.createElement("div");
    help.className = "help-line";
    help.id = `help-${key}`;
    help.hidden = true;
    help.textContent = MC_HELP[key] || "";
    container.appendChild(help);

    return container;
}

function buildMcControls(defaults) {
    const wrap = document.getElementById("mc-controls");
    wrap.innerHTML = "";

    for (const def of MC_SLIDERS) {
        const val = defaults[def.key];

        const readout = document.createElement("div");
        readout.className = "vals";

        const range = document.createElement("input");
        range.type = "range";
        range.min = String(def.min);
        range.max = String(def.max);
        range.step = String(def.step);
        range.value = String(val);
        const fmt = (v) => (def.int ? String(parseInt(v, 10)) : parseFloat(v).toFixed(2));
        readout.textContent = fmt(val);
        range.addEventListener("input", () => {
            readout.textContent = fmt(range.value);
            // Both perturbation and dormant budget reshape the sampling spread.
            if (def.key === "weight_perturbation" || def.key === "dormant_budget") {
                updateAllDistributions();
            }
        });

        mcInputs.set(def.key, { el: range, int: def.int });
        wrap.appendChild(mcControl(def.key, def.label, [readout, range]));
    }

    // random_seed number
    const seed = document.createElement("input");
    seed.type = "number";
    seed.value = String(defaults.random_seed);
    seed.style.width = "90px";
    mcInputs.set("random_seed", { el: seed, int: true });
    wrap.appendChild(mcControl("random_seed", "Random seed", [seed]));
}

function collectMc() {
    const mc = {};
    for (const [key, info] of mcInputs.entries()) {
        const raw = info.el.value;
        if (info.type === "str") mc[key] = raw;
        else if (info.int) mc[key] = parseInt(raw, 10);
        else mc[key] = parseFloat(raw);
    }
    return mc;
}

function collectWeights() {
    const w = {};
    for (const [name, range] of weightInputs.entries()) {
        w[name] = parseFloat(range.value);
    }
    return w;
}

function collectTargets() {
    const t = {};
    for (const [name, inp] of targetInputs.entries()) {
        if (hasTarget(name) && !dontCare.has(name)) t[name] = parseFloat(inp.value);
    }
    return t;
}

function collectDontCare() {
    return [...dontCare];
}

function resetWeights() {
    for (const [name, range] of weightInputs.entries()) {
        range.value = String(baseWeights.get(name) ?? 0);
    }
    for (const inp of targetInputs.values()) inp.value = "";
    dontCare.clear();
    for (const [name, state] of baseStates.entries()) {
        if (state === "excluded") dontCare.add(name);
    }
    for (const name of weightInputs.keys()) updateRowReadout(name);
    refreshPercentages();
}

// ── Run ────────────────────────────────────────────────────────────
async function runModel() {
    const btn = document.getElementById("btn-run");
    btn.disabled = true;
    btn.textContent = "Running…";
    try {
        const res = await fetch("/api/run", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({
                weights: collectWeights(),
                targets: collectTargets(),
                dont_care: collectDontCare(),
                mc: collectMc(),
                top_n: 10,
            }),
        });
        const data = await res.json();
        if (!res.ok) {
            renderError(data.error || `HTTP ${res.status}`);
        } else {
            renderResult(data);
        }
    } catch (e) {
        renderError(String(e));
    } finally {
        btn.disabled = false;
        btn.textContent = "Run Model";
    }
}

// ── Rendering ──────────────────────────────────────────────────────
function show(html) {
    document.getElementById("placeholder").hidden = true;
    const body = document.getElementById("result-body");
    body.hidden = false;
    body.innerHTML = html;
}

function renderError(msg) {
    show(`<div class="error-box">Run failed:\n${escapeHtml(msg)}</div>`);
}

function renderResult(data) {
    const d = data.decision;
    const parts = [];
    parts.push(renderBanner(d));
    parts.push(renderRanking(d));
    parts.push(renderQuestions(d));
    parts.push(renderCv(d));
    parts.push(renderParams(data));
    show(parts.join("\n"));
    wireExpanders();
}

function renderBanner(d) {
    const conf = d.confidence || {};
    const mo = d.model_outputs || {};
    const ci = mo.compromise_ui || [];
    return `
    <div class="rec-banner">
        <div class="rec-title">${escapeHtml(d.recommended?.title || "—")}</div>
        <div class="rec-sub">${escapeHtml(d.recommended?.product_guid || "")}</div>
        <div class="badges">
            <span class="badge conf-${conf.level}">confidence: ${conf.level} (${fmtNum(conf.score)})</span>
            <span class="badge">clear winner: ${d.has_clear_winner}</span>
            <span class="badge">P(rank 1): ${fmtPct(mo.prob_rank_1)}</span>
            <span class="badge">Q (compromise): ${fmtNum(mo.compromise_score)} [${fmtNum(ci[0])}, ${fmtNum(ci[1])}]</span>
            <span class="badge">S=${fmtNum(mo.mean_S)} R=${fmtNum(mo.mean_R)}</span>
        </div>
    </div>`;
}

function renderRanking(d) {
    const recGuid = d.recommended?.product_guid;
    const rows = (d.top_n || [])
        .map((p, i) => {
            const isRec = p.product_guid === recGuid;
            const main = `
            <tr class="${isRec ? "rec-row" : ""}">
                <td>${i + 1}</td>
                <td>${escapeHtml(p.title || "")}</td>
                <td>${fmtNum(p.hai)}</td>
                <td>${fmtNum(p.compromise_score)}</td>
                <td>${fmtPct(p.prob_rank_1)}</td>
                <td>${fmtPct(p.prob_top_5)}</td>
                <td>${fmtNum(p.expected_rank, 2)}</td>
                <td>${fmtPct(p.rank_stability)}</td>
                <td class="toggle-cell" data-row="${i}">▸</td>
            </tr>`;
            const expand = `
            <tr class="expand-row" id="exp-${i}" hidden>
                <td colspan="9">${renderCritScores(p)}</td>
            </tr>`;
            return main + expand;
        })
        .join("");

    return `
    <div class="card">
        <h3>Ranked alternatives (top ${(d.top_n || []).length})</h3>
        <table class="ranking">
            <thead><tr>
                <th>#</th><th>Title</th><th>HAI</th><th>Q</th>
                <th>P(1)</th><th>P(top5)</th><th>E[rank]</th><th>stability</th><th></th>
            </tr></thead>
            <tbody>${rows}</tbody>
        </table>
    </div>`;
}

function renderCritScores(p) {
    const scores = p.criterion_scores || {};
    const descs = p.criterion_scores_description || {};
    const entries = Object.entries(scores).sort((a, b) => b[1] - a[1]);
    const cells = entries
        .map(([name, v]) => {
            const pct = Math.round((v || 0) * 100);
            return `<div class="cs" title="${escapeHtml(descs[name] || "")}">
                <span style="width:120px">${escapeHtml(name)}</span>
                <span class="bar"><span style="width:${pct}%"></span></span>
                <span class="sv">${pct}</span>
            </div>`;
        })
        .join("");
    return `<div class="crit-scores">${cells}</div>`;
}

function renderQuestions(d) {
    const qs = d.refinement_questions || [];
    if (!qs.length) return "";
    const items = qs
        .map(
            (q) => `
        <div class="q-item u-${q.urgency}">
            <div class="q-text">${escapeHtml(q.question)}</div>
            <div class="q-meta">${q.type} · ${q.urgency} · impact ${fmtNum(q.impact_score)}${
                q.criterion ? " · " + escapeHtml(q.criterion) : ""
            }</div>
        </div>`
        )
        .join("");
    return `<div class="card"><h3>Refinement questions (${qs.length})</h3>
        <div class="q-list">${items}</div></div>`;
}

function renderCv(d) {
    const cv = d.criterion_cv || {};
    const entries = Object.entries(cv)
        .filter(([, v]) => v > 0)
        .sort((a, b) => b[1] - a[1]);
    if (!entries.length) return "";
    const max = entries[0][1] || 1;
    const rows = entries
        .map(
            ([name, v]) => `
        <div class="cv-row">
            <span>${escapeHtml(name)}</span>
            <span class="bar"><span style="width:${Math.round((v / max) * 100)}%"></span></span>
            <span class="v">${fmtNum(v)}</span>
        </div>`
        )
        .join("");
    return `<div class="card"><h3>Criterion central-weight CV (differentiators)</h3>
        <div class="cv-list">${rows}</div></div>`;
}

function renderParams(data) {
    const mc = data.mc_params || {};
    const prefs = data.preferences || [];
    const mcStr = Object.entries(mc)
        .map(([k, v]) => `<span>${k}=<code>${v}</code></span>`)
        .join("");
    const prefStr = prefs.length
        ? prefs
              .map((p) => {
                  const par = p.parameters || {};
                  const desc =
                      p.type === "set_target"
                          ? `target=${par.target_value}` +
                            (par.weight != null ? `, w=${par.weight}` : ", w=0.05")
                          : `w=${par.weight}`;
                  return `<span><code>${escapeHtml(p.target_criterion)}: ${escapeHtml(desc)}</code></span>`;
              })
              .join("")
        : "<span>none (baseline weights)</span>";
    return `<div class="card"><h3>Run parameters</h3>
        <div class="params-echo">${mcStr}</div>
        <h3 style="margin-top:14px">Preferences applied</h3>
        <div class="params-echo">${prefStr}</div></div>`;
}

function wireExpanders() {
    document.querySelectorAll(".toggle-cell").forEach((cell) => {
        cell.addEventListener("click", () => {
            const i = cell.dataset.row;
            const row = document.getElementById(`exp-${i}`);
            row.hidden = !row.hidden;
            cell.textContent = row.hidden ? "▸" : "▾";
        });
    });
}

// ── Helpers ────────────────────────────────────────────────────────
function fmtNum(v, dp = 3) {
    return v === null || v === undefined || isNaN(v) ? "—" : Number(v).toFixed(dp);
}
function fmtPct(v) {
    return v === null || v === undefined || isNaN(v) ? "—" : `${(v * 100).toFixed(1)}%`;
}
function escapeHtml(s) {
    return String(s).replace(/[&<>"']/g, (c) => ({
        "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;",
    }[c]));
}

boot();
