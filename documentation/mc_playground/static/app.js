"use strict";

// ══ MCAA playground frontend ═══════════════════════════════════════
// Controls mirror the engine's two uncertainty sources:
//   product sliders  -> epistemic uncertainty (mean + confidence -> Normal std)
//   preference rows  -> preference uncertainty (state + weight -> Dirichlet)
// "Simulate" POSTs to /api/simulate, which runs decision_model.joint_mc's own
// pipeline stage by stage and returns per-sample draws + HAI statistics.

// ── Static config ───────────────────────────────────────────────────
const ATTR_RANGE = 100;
const PRODUCT_COLORS = ["#4f9cf9", "#a78bfa"];
const RANK_COLORS = ["#38c172", "#e06456"]; // 1st / 2nd
const STATES = ["active", "dormant", "excluded"];

// Attributes are positions on taste spectra: 0 = left pole, 100 = right pole.
// Direction is "max", so an active weight expresses how strongly the listener
// prefers the RIGHT pole (electronic / driving beat).
const ATTR_POLES = {
    instrumentation: { lo: "acoustic", hi: "electronic" },
    tempo: { lo: "ambient", hi: "driving beat" },
};

// Defaults straddle the spectra (electronic-but-mellow vs acoustic-but-
// driving) so neither track dominates and the duel stays interesting.
const DEFAULT_PRODUCTS = [
    {
        title: "Neon Skyline",
        attrs: {
            instrumentation: { mean: 80, confidence: 0.9 },
            tempo: { mean: 35, confidence: 0.8 },
        },
    },
    {
        title: "Cedar Groove",
        attrs: {
            instrumentation: { mean: 30, confidence: 0.6 },
            tempo: { mean: 78, confidence: 0.45 },
        },
    },
];

// preference = desired position on the 0-100 spectrum (the engine scores
// tracks by closeness to it); weight = how much the attribute matters.
// Defaults lean electronic on instrumentation (favours Neon Skyline) and
// driving on tempo (favours Cedar Groove) so the duel stays contested.
const DEFAULT_PREFS = {
    instrumentation: { state: "active", weight: 0.5, preference: 70 },
    tempo: { state: "active", weight: 0.5, preference: 70 },
};

// Weight perturbation and dormant budget live with the preference sliders
// (both are preference uncertainty); the remaining engine knobs stay in the
// MC panel.
const PERTURBATION_SLIDER = {
    key: "weight_perturbation", label: "Weight perturbation", min: 0, max: 1, step: 0.05, def: 0.4,
};
const DORMANT_BUDGET_SLIDER = {
    key: "dormant_budget", label: "Dormant budget", min: 0, max: 1, step: 0.05, def: 0.2,
};
const MC_SLIDERS = [
    { key: "vikor_v", label: "VIKOR v", min: 0, max: 1, step: 0.05, def: 0.5 },
];

const MC_HELP = {
    weight_perturbation:
        "How far the sampled weights wander around the weights you set (0-1). " +
        "0 = fixed weights (no preference uncertainty); higher = wider Dirichlet " +
        "spread. Watch the curves above the preference sliders widen. Only " +
        "affects ACTIVE weights, and needs at least two of them: a lone active " +
        "attribute's share is pinned at 1, and dormant attributes use the " +
        "dormant budget instead.",
    vikor_v:
        "VIKOR compromise parameter. v=1 ranks by average weighted performance " +
        "(S); v=0 by the single worst criterion gap (R); 0.5 blends both.",
    dormant_budget:
        "Max total weight share handed to dormant attributes, drawn " +
        "Uniform(0, budget) per simulation. Only matters while an attribute is " +
        "dormant.",
    random_seed:
        "RNG seed. Same seed + same inputs = identical results; change it to " +
        "see pure sampling noise.",
};

let ATTRS = ["instrumentation", "tempo"];
let products = structuredClone(DEFAULT_PRODUCTS);
let prefs = structuredClone(DEFAULT_PREFS);
const mcInputs = new Map();
const prefWidgets = new Map(); // attr -> {slider, valEl, svg, stateBtns}
const attrWidgets = []; // {pi, attr, meanSlider, confSlider, svg, valEl, stdEl}

// ── Boot ────────────────────────────────────────────────────────────
async function boot() {
    try {
        const res = await fetch("/api/config");
        const cfg = await res.json();
        ATTRS = cfg.attributes;
        document.getElementById("n-sims").value = String(cfg.mc_defaults.n_samples);
    } catch {
        /* offline defaults are fine for rendering */
    }

    buildPrefControls();
    buildProductControls();
    buildMcControls();
    refreshPrefCurves();

    document.getElementById("btn-simulate").addEventListener("click", simulate);
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

// ── Preference controls (weight + state per attribute) ─────────────
function buildPrefControls() {
    const wrap = document.getElementById("pref-controls");
    wrap.innerHTML = "";
    for (const attr of ATTRS) {
        const p = prefs[attr];
        const row = document.createElement("div");
        row.className = `slider-row st-${p.state}`;

        const poles = ATTR_POLES[attr] || { lo: "0", hi: "100" };
        const label = document.createElement("div");
        label.className = "label";
        label.innerHTML = escapeHtml(attr);

        const sel = document.createElement("span");
        sel.className = "state-select";
        const stateBtns = {};
        for (const st of STATES) {
            const b = document.createElement("button");
            b.type = "button";
            b.textContent = st;
            b.className = `st-${st}`;
            b.addEventListener("click", () => {
                p.state = st;
                for (const s of STATES) {
                    stateBtns[s].classList.toggle("on", s === st);
                }
                row.className = `slider-row st-${st}`;
                refreshPrefCurves();
            });
            stateBtns[st] = b;
            sel.appendChild(b);
        }
        stateBtns[p.state].classList.add("on");
        label.appendChild(sel);

        const vals = document.createElement("div");
        vals.className = "vals";

        // Where on the spectrum you want to be — labelled by the poles, not
        // exposed as an engine "target".
        const spectrum = document.createElement("div");
        spectrum.className = "spectrum-row";
        const loLab = document.createElement("span");
        loLab.className = "spectrum-pole";
        loLab.textContent = poles.lo;
        const hiLab = document.createElement("span");
        hiLab.className = "spectrum-pole";
        hiLab.textContent = poles.hi;
        const posVal = document.createElement("span");
        posVal.className = "spectrum-val";
        posVal.textContent = String(p.preference);
        const pos = document.createElement("input");
        pos.type = "range";
        pos.className = "spectrum-slider";
        pos.min = "0";
        pos.max = "100";
        pos.step = "1";
        pos.value = String(p.preference);
        pos.addEventListener("input", () => {
            p.preference = parseFloat(pos.value);
            posVal.textContent = pos.value;
        });
        spectrum.append(loLab, pos, hiLab, posVal);

        // How much the attribute matters (normalized share across actives).
        const wLabel = document.createElement("div");
        wLabel.className = "mini-label";
        wLabel.textContent = "importance (weight share)";

        const svg = buildDistSvg(22);

        const slider = document.createElement("input");
        slider.type = "range";
        slider.className = "weight-slider";
        slider.min = "0.05";
        slider.max = "1";
        slider.step = "0.01";
        slider.value = String(p.weight);
        slider.addEventListener("input", () => {
            p.weight = parseFloat(slider.value);
            refreshPrefCurves();
        });

        row.append(label, vals, spectrum, wLabel, svg, slider);
        wrap.appendChild(row);
        prefWidgets.set(attr, { slider, valEl: vals, svg, stateBtns, row });
    }

    // Weight perturbation and dormant budget are preference uncertainty, so
    // their sliders live right under the preference weights whose sampling
    // spread they drive.
    const pertControl = rangeControl(PERTURBATION_SLIDER, () => refreshPrefCurves());
    const pertNote = document.createElement("div");
    pertNote.className = "inert-note";
    pertNote.textContent = "needs ≥2 active attributes to have any effect";
    pertNote.hidden = true;
    pertControl.appendChild(pertNote);
    pertControl.dataset.role = "perturbation-control";
    wrap.appendChild(pertControl);

    wrap.appendChild(
        rangeControl(DORMANT_BUDGET_SLIDER, () => refreshPrefCurves()),
    );
}

// Weight perturbation only spreads the Dirichlet over ACTIVE weights; with
// fewer than two active attributes the single active share is pinned at 1
// (a 1-component Dirichlet is degenerate), so the slider is inert — dim it
// and say why.
function updatePerturbationState() {
    const control = document.querySelector('[data-role="perturbation-control"]');
    if (!control) return;
    let nActive = 0;
    for (const a of ATTRS) {
        if (prefs[a].state === "active") nActive += 1;
    }
    const inert = nActive < 2;
    control.classList.toggle("inert", inert);
    control.querySelector(".inert-note").hidden = !inert;
}

// A labelled range slider with live readout + help line (mc-control layout).
function rangeControl(def, onInput) {
    const readout = document.createElement("div");
    readout.className = "vals";
    readout.textContent = def.def.toFixed(2);

    const range = document.createElement("input");
    range.type = "range";
    range.min = String(def.min);
    range.max = String(def.max);
    range.step = String(def.step);
    range.value = String(def.def);
    range.addEventListener("input", () => {
        readout.textContent = parseFloat(range.value).toFixed(2);
        if (onInput) onInput();
    });
    mcInputs.set(def.key, range);
    return mcControl(def.key, def.label, [readout, range]);
}

// Marginal (mean, sd) of one attribute's sampled weight — mirrors
// joint_mc._sample_weights_hybrid, same derivation as the debugger UI.
function weightMarginal(attr) {
    const p = prefs[attr];
    if (p.state === "excluded") return { kind: "none" };

    let totalActive = 0;
    let nActive = 0;
    let nDormant = 0;
    for (const a of ATTRS) {
        if (prefs[a].state === "active") {
            totalActive += prefs[a].weight;
            nActive += 1;
        } else if (prefs[a].state === "dormant") {
            nDormant += 1;
        }
    }
    const budget = num("dormant_budget");

    if (p.state === "dormant") {
        // Uniform Dirichlet on a Uniform(0, budget) sub-budget. With a single
        // dormant attribute the marginal is Uniform(0, budget) itself.
        if (budget <= 0) return { kind: "spike", mean: 0 };
        const mean = budget / 2 / Math.max(nDormant, 1);
        return { kind: "uniform", lo: 0, hi: budget, mean };
    }

    if (nActive === 0 || totalActive <= 0) return { kind: "none" };
    const m = p.weight / totalActive;
    const pert = num("weight_perturbation");

    const conc = (1 - pert) * 150 + 1;
    const a0 = conc * nActive;
    const varX = (m * (1 - m)) / (a0 + 1);
    const ex2 = varX + m * m;

    const scaled = nDormant > 0 && budget > 0;
    const ey = scaled ? 1 - budget / 2 : 1;
    const ey2 = scaled ? (budget * budget) / 12 + ey * ey : 1;

    const mean = m * ey;
    const variance = Math.max(0, ex2 * ey2 - mean * mean);
    const sd = Math.sqrt(variance);
    if (pert === 0 && !scaled) return { kind: "spike", mean };
    return { kind: "normal", mean, sd };
}

function refreshPrefCurves() {
    let nActive = 0;
    for (const a of ATTRS) {
        if (prefs[a].state === "active") nActive += 1;
    }
    for (const attr of ATTRS) {
        const w = prefWidgets.get(attr);
        const marg = weightMarginal(attr);
        const p = prefs[attr];
        // Weights are normalized shares: a lone active attribute's share is
        // pinned at 1 whatever its slider says, so the slider is inert.
        const weightInert = p.state === "active" && nActive < 2;
        w.row.classList.toggle("weight-inert", weightInert);
        if (weightInert) {
            w.valEl.textContent = "share 100% — weight inert (only active attribute)";
        } else if (p.state === "active") {
            w.valEl.textContent =
                `w=${p.weight.toFixed(2)} (share ${(marg.mean * 100).toFixed(0)}%)`;
        } else if (p.state === "dormant") {
            w.valEl.textContent = `share ~ U(0, budget)`;
        } else {
            w.valEl.textContent = "excluded";
        }
        drawMarginal(w.svg, marg, 1.0);
    }
    updatePerturbationState();
}

// ── Product controls (mean + confidence per attribute) ─────────────
function buildProductControls() {
    const wrap = document.getElementById("product-controls");
    wrap.innerHTML = "";
    products.forEach((prod, pi) => {
        const block = document.createElement("div");
        block.className = "product-block";

        const h = document.createElement("h4");
        h.innerHTML =
            `<span class="swatch" style="background:${PRODUCT_COLORS[pi]}"></span>` +
            `${escapeHtml(prod.title)}`;
        block.appendChild(h);

        for (const attr of ATTRS) {
            const a = prod.attrs[attr];
            const row = document.createElement("div");
            row.className = "attr-row";

            const poles = ATTR_POLES[attr];
            const label = document.createElement("div");
            label.className = "label";
            label.innerHTML = poles
                ? `${escapeHtml(attr)} <span class="muted">· ${escapeHtml(poles.lo)}
                    → ${escapeHtml(poles.hi)}</span>`
                : escapeHtml(attr);

            const vals = document.createElement("div");
            vals.className = "vals";

            const svg = buildDistSvg(26);

            const meanSlider = document.createElement("input");
            meanSlider.type = "range";
            meanSlider.min = "0";
            meanSlider.max = String(ATTR_RANGE);
            meanSlider.step = "1";
            meanSlider.value = String(a.mean);

            const confSlider = document.createElement("input");
            confSlider.type = "range";
            confSlider.className = "conf-slider";
            confSlider.min = "0";
            confSlider.max = "1";
            confSlider.step = "0.01";
            confSlider.value = String(a.confidence);

            const subline = document.createElement("div");
            subline.className = "subline";
            const stdEl = document.createElement("span");
            const confLab = document.createElement("span");
            subline.append(confLab, stdEl);

            const widget = { pi, attr, meanSlider, confSlider, svg, valEl: vals, stdEl, confLab };
            const update = () => {
                a.mean = parseFloat(meanSlider.value);
                a.confidence = parseFloat(confSlider.value);
                refreshAttrRow(widget, a);
            };
            meanSlider.addEventListener("input", update);
            confSlider.addEventListener("input", update);

            row.append(label, vals, svg, meanSlider, confSlider, subline);
            block.appendChild(row);
            attrWidgets.push(widget);
            refreshAttrRow(widget, a);
        }
        wrap.appendChild(block);
    });
}

// std from confidence — same calibrated formula as preprocessing / the server:
// std = max(0.05*range, 0.22*sqrt(1-conf)*range)
function confToStd(conf) {
    return Math.max(0.05 * ATTR_RANGE, 0.22 * Math.sqrt(1 - conf) * ATTR_RANGE);
}

function refreshAttrRow(w, a) {
    const std = confToStd(a.confidence);
    w.valEl.textContent = `mean ${a.mean.toFixed(0)}`;
    w.confLab.textContent = `confidence ${a.confidence.toFixed(2)}`;
    w.stdEl.textContent = `σ = ${std.toFixed(1)}`;
    drawMarginal(w.svg, { kind: "normal", mean: a.mean / ATTR_RANGE, sd: std / ATTR_RANGE }, 1.0);
}

// ── Shared SVG distribution curve (as in the debugger) ─────────────
const SVGNS = "http://www.w3.org/2000/svg";
const VIZ_W = 100;

function buildDistSvg(h) {
    const svg = document.createElementNS(SVGNS, "svg");
    svg.setAttribute("class", "dist");
    svg.setAttribute("viewBox", `0 0 ${VIZ_W} ${h}`);
    svg.setAttribute("preserveAspectRatio", "none");
    svg.dataset.h = String(h);
    const fill = document.createElementNS(SVGNS, "path");
    fill.setAttribute("class", "dist-fill");
    const mean = document.createElementNS(SVGNS, "line");
    mean.setAttribute("class", "dist-mean");
    svg.append(fill, mean);
    return svg;
}

// Draw a marginal onto a dist SVG. Domain is [0, xmax] in normalized units.
function drawMarginal(svg, marg, xmax) {
    const H = parseFloat(svg.dataset.h);
    const top = 2;
    const base = H - 1;
    const fill = svg.querySelector(".dist-fill");
    const line = svg.querySelector(".dist-mean");

    if (!marg || marg.kind === "none") {
        fill.setAttribute("d", "");
        line.setAttribute("x1", "-1");
        line.setAttribute("x2", "-1");
        return;
    }

    const mx = Math.max(0, Math.min(VIZ_W, ((marg.mean ?? 0) / xmax) * VIZ_W));
    line.setAttribute("x1", mx.toFixed(2));
    line.setAttribute("x2", mx.toFixed(2));
    line.setAttribute("y1", String(top - 1));
    line.setAttribute("y2", String(base));

    if (marg.kind === "spike") {
        fill.setAttribute(
            "d",
            `M ${(mx - 0.8).toFixed(2)} ${base} L ${mx.toFixed(2)} ${top} ` +
                `L ${(mx + 0.8).toFixed(2)} ${base} Z`,
        );
        return;
    }

    if (marg.kind === "uniform") {
        const x0 = (marg.lo / xmax) * VIZ_W;
        const x1 = (marg.hi / xmax) * VIZ_W;
        const y = top + (base - top) * 0.35;
        fill.setAttribute(
            "d",
            `M ${x0.toFixed(2)} ${base} L ${x0.toFixed(2)} ${y.toFixed(2)} ` +
                `L ${x1.toFixed(2)} ${y.toFixed(2)} L ${x1.toFixed(2)} ${base} Z`,
        );
        return;
    }

    // Normal bell, peak scaled to 1 (width carries the information).
    const N = 64;
    let d = `M 0 ${base}`;
    for (let i = 0; i <= N; i++) {
        const x = (i / N) * xmax;
        const y = Math.exp(-0.5 * ((x - marg.mean) / Math.max(marg.sd, 1e-6)) ** 2);
        const px = (x / xmax) * VIZ_W;
        const py = base - y * (base - top);
        d += ` L ${px.toFixed(2)} ${py.toFixed(2)}`;
    }
    d += ` L ${VIZ_W} ${base} Z`;
    fill.setAttribute("d", d);
}

// ── MC controls ─────────────────────────────────────────────────────
function buildMcControls() {
    const wrap = document.getElementById("mc-controls");
    wrap.innerHTML = "";
    for (const def of MC_SLIDERS) {
        wrap.appendChild(
            rangeControl(
                def,
                // Dormant budget reshapes the preference sampling spread too.
                def.key === "dormant_budget" ? () => refreshPrefCurves() : null,
            ),
        );
    }
    const seed = document.createElement("input");
    seed.type = "number";
    seed.value = "42";
    seed.style.width = "90px";
    mcInputs.set("random_seed", seed);
    wrap.appendChild(mcControl("random_seed", "Random seed", [seed]));
}

function mcControl(key, labelText, controlEls) {
    const container = document.createElement("div");
    container.className = "mc-control";
    const row = document.createElement("div");
    row.className = "mc-row";
    const label = document.createElement("div");
    label.className = "label";
    label.innerHTML =
        `${escapeHtml(labelText)} ` +
        `<button class="info-btn" type="button" data-target="help-${key}">i</button>`;
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

function num(key) {
    return parseFloat(mcInputs.get(key).value);
}

// ── Simulate ────────────────────────────────────────────────────────
async function simulate() {
    const btn = document.getElementById("btn-simulate");
    btn.disabled = true;
    btn.textContent = "Simulating…";
    try {
        const body = {
            products,
            preferences: prefs,
            mc: {
                n_samples: parseInt(document.getElementById("n-sims").value, 10) || 2000,
                weight_perturbation: num("weight_perturbation"),
                vikor_v: num("vikor_v"),
                dormant_budget: num("dormant_budget"),
                random_seed: parseInt(mcInputs.get("random_seed").value, 10) || 42,
            },
        };
        const res = await fetch("/api/simulate", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(body),
        });
        const data = await res.json();
        if (!res.ok) throw new Error(data.error || `HTTP ${res.status}`);
        renderResult(data);
    } catch (e) {
        renderError(String(e.message || e));
    } finally {
        btn.disabled = false;
        btn.textContent = "Simulate";
    }
}

function renderError(msg) {
    document.getElementById("placeholder").hidden = false;
    document.getElementById("placeholder").innerHTML =
        `<div class="error-box">Simulation failed:\n${escapeHtml(msg)}</div>`;
    document.getElementById("result-body").hidden = true;
}

// ── Result rendering ────────────────────────────────────────────────
function renderResult(data) {
    document.getElementById("placeholder").hidden = true;
    document.getElementById("result-body").hidden = false;

    renderDecision(data);
    renderScatters(data);
    renderWeights(data);
    renderHaiPanel(data);
    renderDuel(data);
    renderParams(data);
}

// ── Final ranking — the recommendation engine's own verdict ────────
function renderDecision(data) {
    const d = data.decision;
    const byId = new Map(data.products.map((p) => [p.id, p]));
    const colorOf = new Map(data.products.map((p, i) => [p.id, PRODUCT_COLORS[i]]));

    const tieBadge = d.recommended_tie
        ? `<span class="badge conf-medium">declared tie: ${escapeHtml(
              d.tie_group.map((t) => t.title).join(" = "),
          )}</span>`
        : "";

    const rows = d.order
        .map((id, i) => {
            const p = byId.get(id);
            return `
            <tr class="${id === d.recommended_id ? "rec-row" : ""}">
                <td>${i + 1}</td>
                <td><span class="swatch" style="display:inline-block;width:9px;height:9px;
                    border-radius:3px;background:${colorOf.get(id)};margin-right:6px"></span>
                    ${escapeHtml(p.title)}</td>
                <td>${p.hai.toFixed(4)} ± ${(2 * p.hai_se).toFixed(4)}</td>
                <td>${(p.prob_rank_1 * 100).toFixed(1)}%</td>
                <td>${p.expected_rank.toFixed(2)}</td>
            </tr>`;
        })
        .join("");

    document.getElementById("decision-panel").innerHTML = `
        <div class="rec-banner">
            <div class="rec-title">${escapeHtml(d.recommended_title)}</div>
            <div class="rec-sub">recommended by assemble_decision()</div>
            <div class="badges">
                <span class="badge conf-${d.confidence_level}">
                    confidence: ${d.confidence_level} (${d.confidence_score.toFixed(3)})</span>
                <span class="badge">clear winner: ${d.has_clear_winner}</span>
                ${tieBadge}
            </div>
        </div>
        <table class="ranking">
            <thead><tr>
                <th>#</th><th>Product</th><th>HAI (±2·SE)</th><th>P(1st)</th><th>E[rank]</th>
            </tr></thead>
            <tbody>${rows}</tbody>
        </table>`;
}

// ── Head-to-head win probability ────────────────────────────────────
function renderDuel(data) {
    const [a, b] = data.products;
    const pw = data.pairwise_win_prob;
    // pairwise_win_prob already splits tie mass 50/50: p_ab + p_ba = 1.
    const pA = pw[0][1];
    const pB = pw[1][0];

    document.getElementById("duel-panel").innerHTML = `
        <div class="duel-labels">
            <span style="color:${PRODUCT_COLORS[0]}">
                ${escapeHtml(a.title)} wins ${(pA * 100).toFixed(1)}%</span>
            <span style="color:${PRODUCT_COLORS[1]}">
                ${escapeHtml(b.title)} wins ${(pB * 100).toFixed(1)}%</span>
        </div>
        <div class="duel-bar">
            <span style="width:${(pA * 100).toFixed(2)}%;background:${PRODUCT_COLORS[0]}"></span>
            <span style="width:${(pB * 100).toFixed(2)}%;background:${PRODUCT_COLORS[1]}"></span>
            <i class="mid"></i>
        </div>
        <div class="duel-caption muted">
            share of the ${data.mc_params.n_samples.toLocaleString()} simulations in which
            each product had the better compromise score (ties split evenly); the
            dashed line marks 50/50
        </div>`;
}

function rankColor(rank) {
    // 2 products: rank 1 (won) or 2 (lost); 1.5 = exact tie, shown as lost.
    return rank <= 1.25 ? RANK_COLORS[0] : RANK_COLORS[1];
}

// One strip chart per product x attribute: sampled value on X (the taste
// spectrum), deterministic jitter on Y so the density is readable.  The two
// attributes are sampled independently, so separate axes avoid suggesting a
// correlation that isn't there.
function renderScatters(data) {
    const row = document.getElementById("scatter-row");
    row.innerHTML = "";
    data.products.forEach((p, pi) => {
        for (const attr of data.sampled_criteria) {
            row.appendChild(stripChart(p, pi, attr));
        }
    });
}

function stripChart(p, pi, attr) {
    const cell = document.createElement("div");
    cell.className = "scatter-cell";

    // Compact caption above the strip: track + attribute (+ P(1st) once).
    const cap = document.createElement("div");
    cap.className = "cap";
    cap.innerHTML =
        `<span><span class="swatch" style="display:inline-block;width:9px;height:9px;` +
        `border-radius:3px;background:${PRODUCT_COLORS[pi]}"></span> ` +
        `${escapeHtml(p.title)} — ${escapeHtml(attr)}</span>` +
        `<span>P(1st) ${(p.prob_rank_1 * 100).toFixed(1)}%</span>`;
    cell.appendChild(cap);

    // Quarter-height strip; same width as the preference-weights chart so
    // the stacked strips and the weights scatter share one row.
    const canvas = document.createElement("canvas");
    canvas.width = 420;
    canvas.height = 75;
    cell.appendChild(canvas);

    const ctx = canvas.getContext("2d");
    const W = canvas.width;
    const H = canvas.height;
    const pad = 10;
    const top = 3;
    const bottom = 16; // room for pole labels
    ctx.clearRect(0, 0, W, H);

    ctx.strokeStyle = "#2c3644";
    ctx.strokeRect(pad, top, W - 2 * pad, H - bottom - top - 2);

    // Pole labels on the spectrum ends.
    const poles = ATTR_POLES[attr] || { lo: "0", hi: String(ATTR_RANGE) };
    ctx.fillStyle = "#8b98a9";
    ctx.font = "10px sans-serif";
    ctx.textAlign = "left";
    ctx.fillText(`← ${poles.lo}`, pad, H - 4);
    ctx.textAlign = "right";
    ctx.fillText(`${poles.hi} →`, W - pad, H - 4);

    const sx = (v) => pad + clamp01(v / ATTR_RANGE) * (W - 2 * pad);

    const xs = p.samples[attr] || [];
    ctx.globalAlpha = 0.45;
    for (let i = 0; i < xs.length; i++) {
        const x = sx(xs[i]);
        // Deterministic jitter spreads the strip vertically (no y meaning).
        const y = top + 4 + (((i * 2654435761) % 1000) / 1000) * (H - bottom - top - 10);
        ctx.fillStyle = rankColor(p.sample_ranks[i]);
        ctx.fillRect(x - 1.2, y - 1.2, 2.4, 2.4);
    }
    ctx.globalAlpha = 1;

    // Stated mean: vertical dashed line across the strip.
    const mx = sx(products[pi].attrs[attr]?.mean ?? 0);
    ctx.strokeStyle = "#e6edf3";
    ctx.lineWidth = 1.4;
    ctx.setLineDash([4, 3]);
    ctx.beginPath();
    ctx.moveTo(mx, top);
    ctx.lineTo(mx, H - bottom - 2);
    ctx.stroke();
    ctx.setLineDash([]);

    // Your preferred spot on the spectrum (amber): tracks are scored by
    // closeness of the samples to this line.
    if (prefs[attr]?.state === "active") {
        const px = sx(prefs[attr].preference);
        ctx.strokeStyle = "#e0a43b";
        ctx.lineWidth = 1.6;
        ctx.beginPath();
        ctx.moveTo(px, top);
        ctx.lineTo(px, H - bottom - 2);
        ctx.stroke();
    }
    ctx.lineWidth = 1;

    return cell;
}

// One strip per attribute weight, same footprint as the attribute strips:
// each dot is that attribute's sampled share of one weight-vector draw.
function renderWeights(data) {
    const wrap = document.getElementById("weights-strips");
    wrap.innerHTML = "";
    const names = data.weight_samples.names;
    const vals = data.weight_samples.values;
    names.forEach((name, j) => {
        wrap.appendChild(weightStrip(name, vals.map((w) => w[j])));
    });
}

function weightStrip(name, samples) {
    const cell = document.createElement("div");
    cell.className = "scatter-cell";

    const sorted = [...samples].sort((a, b) => a - b);
    const q = (p) => sorted[Math.min(sorted.length - 1, Math.floor(p * sorted.length))];
    const mean = samples.reduce((a, b) => a + b, 0) / Math.max(samples.length, 1);

    const cap = document.createElement("div");
    cap.className = "cap";
    cap.innerHTML =
        `<span>w(${escapeHtml(name)})</span>` +
        `<span>p5 ${q(0.05).toFixed(3)} · median ${q(0.5).toFixed(3)} · ` +
        `p95 ${q(0.95).toFixed(3)}</span>`;
    cell.appendChild(cap);

    const canvas = document.createElement("canvas");
    canvas.width = 420;
    canvas.height = 75;
    cell.appendChild(canvas);

    const ctx = canvas.getContext("2d");
    const W = canvas.width;
    const H = canvas.height;
    const pad = 10;
    const top = 3;
    const bottom = 16;
    ctx.clearRect(0, 0, W, H);

    ctx.strokeStyle = "#2c3644";
    ctx.strokeRect(pad, top, W - 2 * pad, H - bottom - top - 2);

    // Weight-share axis labels (weights are normalized shares in [0, 1]).
    ctx.fillStyle = "#8b98a9";
    ctx.font = "10px sans-serif";
    ctx.textAlign = "left";
    ctx.fillText("0", pad, H - 4);
    ctx.textAlign = "center";
    ctx.fillText("weight share", W / 2, H - 4);
    ctx.textAlign = "right";
    ctx.fillText("1", W - pad, H - 4);

    const sx = (v) => pad + clamp01(v) * (W - 2 * pad);

    ctx.fillStyle = "#4f9cf9";
    ctx.globalAlpha = 0.4;
    for (let i = 0; i < samples.length; i++) {
        const x = sx(samples[i]);
        const y = top + 4 + (((i * 2654435761) % 1000) / 1000) * (H - bottom - top - 10);
        ctx.fillRect(x - 1.2, y - 1.2, 2.4, 2.4);
    }
    ctx.globalAlpha = 1;

    // Mean sampled share: vertical dashed line.
    const mx = sx(mean);
    ctx.strokeStyle = "#e6edf3";
    ctx.lineWidth = 1.4;
    ctx.setLineDash([4, 3]);
    ctx.beginPath();
    ctx.moveTo(mx, top);
    ctx.lineTo(mx, H - bottom - 2);
    ctx.stroke();
    ctx.setLineDash([]);
    ctx.lineWidth = 1;

    return cell;
}

function renderHaiPanel(data) {
    const panel = document.getElementById("hai-panel");
    panel.innerHTML = "";
    const grid = document.createElement("div");
    grid.className = "hai-grid";

    const beta = data.roc_metaweights;
    const ceiling = beta[0];

    data.products.forEach((p, pi) => {
        const cell = document.createElement("div");
        cell.className = "hai-cell";

        cell.innerHTML = `
            <div class="name">
                <span class="swatch" style="background:${PRODUCT_COLORS[pi]}"></span>
                ${escapeHtml(p.title)}
            </div>`;

        // HAI gauge with +/-2SE whiskers on a 0..beta1 scale.
        const canvas = document.createElement("canvas");
        canvas.width = 260;
        canvas.height = 46;
        cell.appendChild(canvas);
        const ctx = canvas.getContext("2d");
        const W = canvas.width;
        const x = (v) => 6 + (v / ceiling) * (W - 12);
        ctx.clearRect(0, 0, W, canvas.height);
        // track
        ctx.fillStyle = "#0f1419";
        ctx.fillRect(6, 16, W - 12, 12);
        ctx.strokeStyle = "#2c3644";
        ctx.strokeRect(6, 16, W - 12, 12);
        // bar
        ctx.fillStyle = PRODUCT_COLORS[pi];
        ctx.fillRect(6, 16, Math.max(0, x(p.hai) - 6), 12);
        // +/-2SE whiskers
        const lo = x(Math.max(0, p.hai - 2 * p.hai_se));
        const hi = x(Math.min(ceiling, p.hai + 2 * p.hai_se));
        ctx.strokeStyle = "#e6edf3";
        ctx.lineWidth = 1.4;
        ctx.beginPath();
        ctx.moveTo(lo, 22);
        ctx.lineTo(hi, 22);
        ctx.moveTo(lo, 17);
        ctx.lineTo(lo, 27);
        ctx.moveTo(hi, 17);
        ctx.lineTo(hi, 27);
        ctx.stroke();
        ctx.lineWidth = 1;
        // scale labels
        ctx.fillStyle = "#8b98a9";
        ctx.font = "9px sans-serif";
        ctx.textAlign = "left";
        ctx.fillText("0", 6, 42);
        ctx.textAlign = "right";
        ctx.fillText(`β₁=${ceiling.toFixed(3)} (always 1st)`, W - 6, 42);

        // Rank-acceptability stacked bar — the variance source of HAI.
        const stack = document.createElement("div");
        stack.className = "rank-stack";
        p.rank_acceptability.forEach((frac, r) => {
            const seg = document.createElement("span");
            seg.style.width = `${(frac * 100).toFixed(2)}%`;
            seg.style.background = RANK_COLORS[r] || "#555";
            seg.title = `rank ${r + 1}: ${(frac * 100).toFixed(1)}%`;
            stack.appendChild(seg);
        });
        cell.appendChild(stack);

        const legend = document.createElement("div");
        legend.className = "rank-legend";
        legend.innerHTML = p.rank_acceptability
            .map(
                (frac, r) =>
                    `<span class="rank-chip r${r + 1}">${r + 1}${["st", "nd", "rd"][r] || "th"} ` +
                    `${(frac * 100).toFixed(1)}% · β=${beta[r].toFixed(3)}</span>`,
            )
            .join("");
        cell.appendChild(legend);

        const stats = document.createElement("div");
        stats.className = "stats";
        stats.innerHTML =
            `<span>HAI <b>${p.hai.toFixed(4)}</b> ± ${(2 * p.hai_se).toFixed(4)} (2·SE)</span>` +
            `<span>per-sample σ(β_rank) <b>${p.hai_sample_std.toFixed(4)}</b></span>` +
            `<span>E[rank] <b>${p.expected_rank.toFixed(2)}</b> · rank stability ` +
            `<b>${(p.rank_stability * 100).toFixed(0)}%</b></span>` +
            `<span>compromise <b>${p.compromise_score.toFixed(3)}</b> ` +
            `[${p.compromise_ci[0].toFixed(3)}, ${p.compromise_ci[1].toFixed(3)}] (95% CI)</span>`;
        cell.appendChild(stats);

        grid.appendChild(cell);
    });
    panel.appendChild(grid);
}

function renderParams(data) {
    const mc = data.mc_params || {};
    const crits = data.criteria || [];
    const echo = document.getElementById("params-echo");
    echo.innerHTML =
        Object.entries(mc)
            .map(([k, v]) => `<span>${k}=<code>${v}</code></span>`)
            .join("") +
        crits
            .map(
                (c) =>
                    `<span><code>${escapeHtml(c.name)}: ${c.state}` +
                    `${c.state === "active" ? `, pos=${c.preference}, w=${c.weight}` : ""}</code></span>`,
            )
            .join("") +
        `<span>plot stride=<code>${data.plot_stride}</code> (every ` +
        `${data.plot_stride}${ordinal(data.plot_stride)} sample plotted)</span>`;
}

// ── Helpers ─────────────────────────────────────────────────────────
function clamp01(v) {
    return Math.max(0, Math.min(1, v));
}
function ordinal(n) {
    return n === 1 ? "st" : n === 2 ? "nd" : n === 3 ? "rd" : "th";
}
function escapeHtml(s) {
    return String(s).replace(/[&<>"']/g, (c) => ({
        "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;",
    }[c]));
}

boot();
