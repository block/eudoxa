/**
 * Eudoxa Shopping Assistant — Client-side JS
 *
 * Handles:
 * - Session creation and management
 * - Chat messaging with the server
 * - Rendering of text + structured HTML components
 * - Sidebar state updates
 * - State inspector modal
 */

const API_BASE = "";

// ── State ───────────────────────────────────────────────────────────

let sessionId = null;
let isLoading = false;

// ── DOM refs ────────────────────────────────────────────────────────

const chatMessages = document.getElementById("chat-messages");
const chatInput = document.getElementById("chat-input");
const btnSend = document.getElementById("btn-send");
const btnNewSessionBlackbox = document.getElementById(
  "btn-new-session-blackbox",
);
const btnNewSessionTransparent = document.getElementById(
  "btn-new-session-transparent",
);
const btnNewSessionDebug = document.getElementById("btn-new-session-debug");
const modeIndicator = document.getElementById("mode-indicator");
const btnShowState = document.getElementById("btn-show-state");
const sessionInfo = document.getElementById("session-info");
const decisionPanel = document.getElementById("decision-panel");
const auditPanel = document.getElementById("audit-panel");
const btnSettings = document.getElementById("btn-settings");
const settingsMenu = document.getElementById("settings-menu");
const modelSelect = document.getElementById("model-select");
const stateModal = document.getElementById("state-modal");
const stateJson = document.getElementById("state-json");
const btnCloseModal = document.getElementById("btn-close-modal");

// ── Session management ──────────────────────────────────────────────

async function createSession(
  domain = "snowboards",
  transparencyMode = "black_box",
) {
  try {
    const res = await fetch(`${API_BASE}/api/session`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ domain, transparency_mode: transparencyMode }),
    });
    const data = await res.json();
    if (data.error) {
      showError(data.error);
      return;
    }

    sessionId = data.session_id;
    chatInput.disabled = false;
    btnSend.disabled = false;

    // Clear chat and sidebar panels from previous session
    chatMessages.innerHTML = "";
    decisionPanel.innerHTML = "";
    auditPanel.innerHTML = "";

    // Show mode indicator
    modeIndicator.style.display = "inline-block";
    if (transparencyMode === "debug") {
      modeIndicator.textContent = "🛠 Debug";
      modeIndicator.className = "mode-indicator mode-debug";
    } else if (transparencyMode === "transparent") {
      modeIndicator.textContent = "🔓 Transparent";
      modeIndicator.className = "mode-indicator mode-transparent";
    } else {
      modeIndicator.textContent = "🔒 Black Box";
      modeIndicator.className = "mode-indicator mode-blackbox";
    }

    // Update sidebar
    updateSessionInfo(data);

    // Show static welcome message (don't auto-send to LLM)
    const nProducts = data.domain_info?.n_alternatives || 9;
    const nCriteria = data.domain_info?.n_criteria || 0;
    const welcomeText =
      `Demo scenario: a shopper searches for "snowboards" and picks the configured snowboard merchant ` +
      `to buy from. (The demo is deliberately narrow to keep data gathering simple.)\n\n\n` +
      `Describe your preferences and trade-offs and the engine will make recommendations. You can also ask ` +
      `for the sources of facts, trade-offs between the shortlisted boards, and more.\n\n` +
      `The dataset covers **${nProducts}** snowboards from the configured merchant. ` +
      `Tell me what matters to you in a snowboard, or just say **"go"** and I'll start the model with minimal default preferences!` +
      `\n\n\nNote: session state lives in this browser tab — reloading starts a new session ` +
      `(or use the buttons in the top right). "Black Box" keeps the decision model strictly sandboxed away ` +
      `from the LLM; "Transparent" lets the LLM see more of the model's methodology.`;
    appendAssistantMessage({
      text: welcomeText,
      html_blocks: [],
      tool_calls: [],
    });
  } catch (err) {
    showError("Failed to create session: " + err.message);
  }
}

// ── Messaging ───────────────────────────────────────────────────────

async function sendMessage(text) {
  if (!sessionId || isLoading) return;
  if (!text.trim()) return;

  isLoading = true;
  btnSend.disabled = true;
  chatInput.disabled = true;

  // Show user message
  appendMessage("user", text);
  chatInput.value = "";

  // Show loading indicator
  const loadingEl = appendLoading();

  try {
    const res = await fetch(`${API_BASE}/api/message`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ session_id: sessionId, message: text }),
    });
    const data = await res.json();

    // Remove loading
    loadingEl.remove();

    if (data.error) {
      showError(data.error);
    } else {
      appendAssistantMessage(data);
      updateSidebarFromResponse(data);
    }
  } catch (err) {
    loadingEl.remove();
    showError("Failed to send message: " + err.message);
  } finally {
    isLoading = false;
    btnSend.disabled = false;
    chatInput.disabled = false;
    chatInput.focus();
  }
}

// ── Message rendering ───────────────────────────────────────────────

function appendMessage(role, text) {
  const div = document.createElement("div");
  div.className = `message message-${role}`;
  div.innerHTML = `<div class="message-bubble"><div class="message-text">${escapeAndFormat(text)}</div></div>`;
  chatMessages.appendChild(div);
  scrollToBottom();
}

function appendAssistantMessage(data) {
  const div = document.createElement("div");
  div.className = "message message-assistant";

  let html = '<div class="message-bubble">';

  // Render text (convert basic markdown)
  if (data.text) {
    html += `<div class="message-text">${formatText(data.text)}</div>`;
  }

  // Render HTML components
  if (data.html_blocks && data.html_blocks.length > 0) {
    html += '<div class="message-components">';
    for (const block of data.html_blocks) {
      html += block;
    }
    html += "</div>";
  }

  html += "</div>";
  div.innerHTML = html;

  // If the message contains discrete-choice blocks, append an
  // "Update recommendations" button after the last one.
  const dcBlocks = div.querySelectorAll(".discrete-choice");
  if (dcBlocks.length > 0) {
    const rerunBtn = document.createElement("button");
    rerunBtn.className = "dc-rerun-btn";
    rerunBtn.textContent = "Update recommendations ▶";
    // Insert after the components container (inside the bubble)
    const bubble = div.querySelector(".message-bubble");
    if (bubble) {
      bubble.appendChild(rerunBtn);
    }
  }

  chatMessages.appendChild(div);
  scrollToBottom();
}

function appendLoading() {
  const div = document.createElement("div");
  div.className = "message-loading";
  div.innerHTML =
    '<div class="loading-dots"><span></span><span></span><span></span></div> <span>Thinking...</span>';
  chatMessages.appendChild(div);
  scrollToBottom();
  return div;
}

function showError(msg) {
  const div = document.createElement("div");
  div.className = "message message-assistant";
  div.innerHTML = `<div class="message-bubble" style="border-color: var(--danger); background: rgba(248,113,113,0.1);"><div class="message-text" style="color: var(--danger);">⚠️ ${escapeHtml(msg)}</div></div>`;
  chatMessages.appendChild(div);
  scrollToBottom();
}

function scrollToBottom() {
  chatMessages.scrollTop = chatMessages.scrollHeight;
}

// ── Text formatting ─────────────────────────────────────────────────

function escapeHtml(text) {
  const div = document.createElement("div");
  div.textContent = text;
  return div.innerHTML;
}

function escapeAndFormat(text) {
  return escapeHtml(text);
}

function formatText(text) {
  // Remove component placeholders like [recommendation_card]
  let formatted = text.replace(/\[(\w+)\]/g, "");

  // {ACTION}...{/ACTION} → clickable inline buttons
  // Must run BEFORE bold replacement so **bold** inside actions works correctly.
  formatted = formatted.replace(
    /\{ACTION\}(.+?)\{\/ACTION\}/g,
    function (_match, actionText) {
      // Escape HTML inside the data attribute (double-quote safe)
      const safeAttr = actionText
        .replace(/&/g, "&amp;")
        .replace(/"/g, "&quot;");
      return `<button class="action-btn" data-action="${safeAttr}">${actionText}</button>`;
    },
  );

  // Auto-link URLs (must run after {ACTION} replacement to avoid double-processing)
  // Matches http/https URLs not already inside an HTML attribute (href="..." or data-action="...")
  formatted = formatted.replace(
    /(?<!="|')(https?:\/\/[^\s<>"')\]]+)/g,
    '<a href="$1" target="_blank" rel="noopener noreferrer">$1</a>'
  );

  // Basic markdown-like formatting
  // Bold: **text**
  formatted = formatted.replace(/\*\*(.+?)\*\*/g, "<strong>$1</strong>");
  // Bullet lists
  formatted = formatted.replace(/^[-•]\s+(.+)$/gm, "<li>$1</li>");
  formatted = formatted.replace(/(<li>.*<\/li>\n?)+/g, function (match) {
    return "<ul>" + match.replace(/\n/g, "") + "</ul>";
  });
  // Numbered lists
  formatted = formatted.replace(/^\d+\.\s+(.+)$/gm, "<li>$1</li>");
  // Paragraphs (double newline)
  formatted = formatted.replace(/\n\n/g, "</p><p>");
  formatted = `<p>${formatted}</p>`;
  // Clean up
  formatted = formatted.replace(/<p>\s*<\/p>/g, "");
  formatted = formatted.replace(/<p>\s*<ul>/g, "<ul>");
  formatted = formatted.replace(/<\/ul>\s*<\/p>/g, "</ul>");

  return formatted;
}

// ── Sidebar updates ─────────────────────────────────────────────────

function updateSessionInfo(data) {
  const info = data.domain_info || {};
  sessionInfo.innerHTML = `
    <h3>Session</h3>
    <span class="session-badge">${sessionId}</span>
    <p style="margin-top:8px;">Domain: <strong>${info.domain || "?"}</strong></p>
    <p>${info.n_alternatives || 0} products · ${info.n_criteria || 0} criteria</p>
  `;
}

function updateSidebarFromResponse(data) {
  // Try to update decision panel from tool calls
  if (data.tool_calls) {
    for (const tc of data.tool_calls) {
      if (
        tc.tool === "run_model" &&
        tc.output_summary &&
        tc.output_summary.startsWith("Recommended")
      ) {
        fetchAndUpdateDecision();
      }
    }
  }

  // Always refresh the preferences panel after any response that involved
  // tool calls — the model run sets latest_transforms on the session and
  // we must not gate the preference panel update on the /decision endpoint
  // succeeding (which can fail due to serialisation issues in the full
  // decision payload).
  if (data.tool_calls && data.tool_calls.length > 0) {
    fetchAndUpdatePreferences();
  }
}

async function fetchAndUpdateDecision() {
  if (!sessionId) return;
  try {
    const res = await fetch(
      `${API_BASE}/api/session/${sessionId}/decision`,
    );
    if (!res.ok) return;
    const data = await res.json();

    const rec = data.recommended || {};
    const conf = data.confidence || {};
    const topN = data.top_n || [];

    let html = `<h3>Latest Decision</h3>
      <div class="sidebar-decision-mini">
        <div class="rec-name">${rec.title || "?"}</div>
        <div>Confidence: ${conf.level || "?"} (${Math.round((conf.score || 0) * 100)}%)</div>
        <div style="margin-top:6px; font-size:0.85rem;">`;

    for (let i = 0; i < Math.min(topN.length, 3); i++) {
      const p = topN[i];
      html += `<div>#${i + 1} ${p.title} (${Math.round(p.compromise_score * 100)}%)</div>`;
    }

    html += "</div></div>";
    decisionPanel.innerHTML = html;
  } catch (err) {
    // silently ignore
  }
}

/**
 * Fetch session state and update the preferences panel independently of
 * the /decision endpoint.  This ensures preference overrides render even
 * when the (large) decision payload fails to serialise.
 */
async function fetchAndUpdatePreferences() {
  if (!sessionId) return;
  try {
    const stateRes = await fetch(
      `${API_BASE}/api/session/${sessionId}/state`,
    );
    if (stateRes.ok) {
      const state = await stateRes.json();
      updateAuditPanel(state);
    }
  } catch (err) {
    // silently ignore — preference panel is best-effort
  }
}

// ── Preference tile state (client-side, synced to server) ───────────

let localPreferences = [];

function updateAuditPanel(state) {
  if (!auditPanel) return;

  const ops = state.latest_transforms || state.preference_ops || [];
  localPreferences = JSON.parse(JSON.stringify(ops)); // deep copy

  renderPreferenceTiles();
}

function renderPreferenceTiles() {
  if (!auditPanel) return;

  if (localPreferences.length === 0) {
    auditPanel.innerHTML =
      "<h3>Preference Overrides</h3><p class='muted'>None</p>";
    return;
  }

  let html = "<h3>Preference Overrides</h3>";
  for (let i = 0; i < localPreferences.length; i++) {
    const transform = localPreferences[i].transform || localPreferences[i];
    const criterionName = formatCriterionName(transform.target_criterion || "");
    const params = transform.parameters || {};

    html += `<div class="pref-tile" data-index="${i}">`;
    html += `<button class="pref-tile-delete" data-index="${i}" title="Remove preference">×</button>`;
    html += `<div class="pref-tile-name">${escapeHtml(criterionName)}</div>`;

    if (transform.type === "set_target") {
      const targetVal = params.target_value ?? "?";
      const tolerance = params.tolerance ?? 0;
      const weight = params.weight ?? "?";
      html += `<div class="pref-tile-details">`;
      html += `<span class="pref-tile-field" data-index="${i}" data-field="target_value" data-editable="true">Target: <strong>${targetVal}</strong></span>`;
      if (tolerance > 0) {
        html += ` <span class="pref-tile-field" data-index="${i}" data-field="tolerance" data-editable="true">±${tolerance}</span>`;
      }
      html += `<br><span class="pref-tile-field" data-index="${i}" data-field="weight" data-editable="true">Weight: <strong>${formatWeight(weight)}</strong></span>`;
      html += `</div>`;
    } else if (transform.type === "set_weight") {
      const weight = params.weight ?? "?";
      html += `<div class="pref-tile-details">`;
      html += `<span class="pref-tile-field" data-index="${i}" data-field="weight" data-editable="true">Weight: <strong>${formatWeight(weight)}</strong></span>`;
      html += `</div>`;
    } else if (transform.type === "set_state") {
      const state = params.state ?? "?";
      const label =
        state === "excluded"
          ? "Don't care — excluded from ranking"
          : `State: ${state}`;
      html += `<div class="pref-tile-details"><span class="pref-tile-type">${escapeHtml(label)}</span></div>`;
    } else if (transform.type === "flip_direction" || transform.type === "invert_score") {
      html += `<div class="pref-tile-details"><span class="pref-tile-type">${transform.type === "flip_direction" ? "Direction flipped" : "Score inverted"}</span></div>`;
    } else {
      // Fallback: show weight if available, otherwise show type
      if (params.weight != null) {
        html += `<div class="pref-tile-details">`;
        html += `<span class="pref-tile-field" data-index="${i}" data-field="weight" data-editable="true">Weight: <strong>${formatWeight(params.weight)}</strong></span>`;
        html += `</div>`;
      } else {
        html += `<div class="pref-tile-details"><span class="pref-tile-type">${escapeHtml(transform.type)}</span></div>`;
      }
    }

    html += `</div>`;
  }
  auditPanel.innerHTML = html;

  // Attach event listeners
  auditPanel.querySelectorAll(".pref-tile-delete").forEach((btn) => {
    btn.addEventListener("click", handlePrefDelete);
  });
  auditPanel.querySelectorAll("[data-editable='true']").forEach((el) => {
    el.addEventListener("click", handlePrefEditStart);
  });
}

function formatCriterionName(name) {
  // Convert snake_case to Title Case and strip trailing _159 etc.
  return name
    .replace(/_\d+$/, "")
    .replace(/_/g, " ")
    .replace(/\b\w/g, (c) => c.toUpperCase());
}

function formatWeight(w) {
  if (typeof w === "number") {
    return `${(w * 100).toFixed(1)}%`;
  }
  return String(w);
}

function handlePrefDelete(e) {
  const idx = parseInt(e.currentTarget.dataset.index, 10);
  localPreferences.splice(idx, 1);
  renderPreferenceTiles();
  syncPreferencesToServer();
}

function handlePrefEditStart(e) {
  const el = e.currentTarget;
  const idx = parseInt(el.dataset.index, 10);
  const field = el.dataset.field;
  const transform = localPreferences[idx].transform || localPreferences[idx];
  const params = transform.parameters || {};

  let currentValue;
  currentValue = params[field] ?? "";

  // Mark tile as editing
  const tile = el.closest(".pref-tile");
  tile.classList.add("pref-tile-editing");

  // Replace span with input
  const input = document.createElement("input");
  input.type = "number";
  input.step = "any";
  input.className = "pref-tile-input";
  input.value = currentValue;

  let done = false;

  // Weight edits also offer an explicit "Don't care" choice: instead of
  // encoding disinterest in the weight value, the transform becomes
  // set_state(state="excluded") and the criterion is dropped from the ranking.
  let replacement = input;
  if (field === "weight") {
    const wrap = document.createElement("span");
    wrap.className = "pref-tile-edit-wrap";
    const dontCareBtn = document.createElement("button");
    dontCareBtn.type = "button";
    dontCareBtn.className = "pref-tile-dontcare";
    dontCareBtn.textContent = "Don't care";
    dontCareBtn.title = "Exclude this criterion from the ranking";
    // mousedown fires before the input's blur commit
    dontCareBtn.addEventListener("mousedown", (ev) => {
      ev.preventDefault();
      done = true;
      transform.type = "set_state";
      transform.parameters = { state: "excluded" };
      tile.classList.remove("pref-tile-editing");
      renderPreferenceTiles();
      syncPreferencesToServer();
    });
    wrap.append(input, dontCareBtn);
    replacement = wrap;
  }

  el.replaceWith(replacement);
  input.focus();
  input.select();

  // Commit on blur or Enter
  const commit = () => {
    if (done) return;
    done = true;
    const newValue = parseFloat(input.value);
    if (!isNaN(newValue)) {
      if (!transform.parameters) transform.parameters = {};
      transform.parameters[field] = newValue;
      // If this is the raw transform (not wrapped in {transform: ...}), update directly
      if (!localPreferences[idx].transform) {
        localPreferences[idx].parameters = transform.parameters;
      }
    }
    tile.classList.remove("pref-tile-editing");
    renderPreferenceTiles();
    syncPreferencesToServer();
  };

  input.addEventListener("blur", commit);
  input.addEventListener("keydown", (ev) => {
    if (ev.key === "Enter") {
      ev.preventDefault();
      input.blur();
    } else if (ev.key === "Escape") {
      done = true;
      tile.classList.remove("pref-tile-editing");
      renderPreferenceTiles(); // revert without saving
    }
  });
}

async function syncPreferencesToServer() {
  if (!sessionId) return;
  try {
    await fetch(
      `${API_BASE}/api/session/${sessionId}/preferences`,
      {
        method: "PATCH",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ preferences: localPreferences }),
      }
    );
  } catch (err) {
    console.error("Failed to sync preferences:", err);
  }
}

function describeTransform(transform) {
  if (!transform || !transform.type) return "";

  const target = formatCriterionName(transform.target_criterion || "this criterion");
  const params = transform.parameters || {};
  switch (transform.type) {
    case "set_weight":
      return `${target}: ${formatWeight(params.weight ?? 0)}`;
    case "set_state":
      return params.state === "excluded"
        ? `${target}: don't care`
        : `${target}: ${params.state}`;
    case "set_target":
      return `${target}: target ${params.target_value ?? "?"} ±${params.tolerance ?? 0}, ${formatWeight(params.weight ?? 0)}`;
    case "flip_direction":
      return `${target}: direction flipped`;
    case "invert_score":
      return `${target}: score inverted`;
    case "add_criterion":
      return `${target}: added`;
    default:
      return `${target}: ${transform.type}`;
  }
}

// ── State inspector ─────────────────────────────────────────────────

async function showStateModal() {
  if (!sessionId) {
    stateJson.textContent = "No active session";
    stateModal.style.display = "flex";
    return;
  }
  try {
    const [stateRes, decisionRes] = await Promise.all([
      fetch(`${API_BASE}/api/session/${sessionId}/state`),
      fetch(`${API_BASE}/api/session/${sessionId}/decision`),
    ]);

    const state = await stateRes.json();
    let decision = null;
    if (decisionRes.ok) {
      decision = await decisionRes.json();
    }

    stateJson.textContent = JSON.stringify(
      { session_state: state, latest_decision: decision },
      null,
      2,
    );
  } catch (err) {
    stateJson.textContent = "Error fetching state: " + err.message;
  }
  stateModal.style.display = "flex";
}

// ── Event listeners ─────────────────────────────────────────────────

btnNewSessionBlackbox.addEventListener("click", () =>
  createSession("snowboards", "black_box"),
);
btnNewSessionTransparent.addEventListener("click", () =>
  createSession("snowboards", "transparent"),
);
btnNewSessionDebug.addEventListener("click", () =>
  createSession("snowboards", "debug"),
);

btnSend.addEventListener("click", () => {
  sendMessage(chatInput.value);
});

chatInput.addEventListener("keydown", (e) => {
  if (e.key === "Enter" && !e.shiftKey) {
    e.preventDefault();
    sendMessage(chatInput.value);
  }
});

// Auto-resize textarea
chatInput.addEventListener("input", () => {
  chatInput.style.height = "auto";
  chatInput.style.height = Math.min(chatInput.scrollHeight, 120) + "px";
});

btnShowState.addEventListener("click", showStateModal);
btnCloseModal.addEventListener("click", () => {
  stateModal.style.display = "none";
});
stateModal.addEventListener("click", (e) => {
  if (e.target === stateModal) stateModal.style.display = "none";
});

// Copy state to clipboard
const btnCopyState = document.getElementById("btn-copy-state");
btnCopyState.addEventListener("click", async () => {
  const text = stateJson.textContent;
  if (!text) return;
  try {
    await navigator.clipboard.writeText(text);
    const original = btnCopyState.textContent;
    btnCopyState.textContent = "✓ Copied!";
    setTimeout(() => {
      btnCopyState.textContent = original;
    }, 2000);
  } catch (err) {
    // Fallback for older browsers or non-HTTPS contexts
    const textarea = document.createElement("textarea");
    textarea.value = text;
    textarea.style.position = "fixed";
    textarea.style.opacity = "0";
    document.body.appendChild(textarea);
    textarea.select();
    document.execCommand("copy");
    document.body.removeChild(textarea);
    const original = btnCopyState.textContent;
    btnCopyState.textContent = "✓ Copied!";
    setTimeout(() => {
      btnCopyState.textContent = original;
    }, 2000);
  }
});

// ── Discrete-choice click handling ──────────────────────────────────

/**
 * Determines whether a discrete-choice question supports multi-select
 * (contiguous range selection). A question supports multi-select if it
 * has options that look like numeric ranges (e.g. "5.0–6.8", "6.8–8.5").
 */
function isRangeQuestion(optionsContainer) {
  const buttons = optionsContainer.querySelectorAll(".dc-option:not(.dc-na)");
  // Need at least 2 non-n/a options, and at least one must match a range pattern
  if (buttons.length < 2) return false;
  const rangePattern = /^[\d.]+\s*[–—-]\s*[\d.]+$/;
  let rangeCount = 0;
  buttons.forEach((b) => {
    if (rangePattern.test(b.dataset.value.trim())) rangeCount++;
  });
  // Consider it a range question if most non-special options are ranges
  // (exclude "doesn't matter" which is text-only)
  return rangeCount >= 2;
}

/**
 * Given the selected buttons in a range question, check if a candidate
 * button index is contiguous with the current selection. Returns true if
 * clicking it would keep the selection contiguous.
 */
function wouldBeContiguous(buttons, candidateIdx) {
  // Gather indices of currently selected range buttons (excluding n/a)
  const selectedIndices = [];
  buttons.forEach((b, i) => {
    if (b.classList.contains("dc-selected") && !b.classList.contains("dc-na")) {
      selectedIndices.push(i);
    }
  });

  // If nothing selected yet, any click is contiguous
  if (selectedIndices.length === 0) return true;

  // Add the candidate to the set and check contiguity
  const allIndices = [...new Set([...selectedIndices, candidateIdx])].sort(
    (a, b) => a - b,
  );
  for (let i = 1; i < allIndices.length; i++) {
    if (allIndices[i] - allIndices[i - 1] !== 1) return false;
  }
  return true;
}

/**
 * Build the merged value string from all selected range buttons.
 * For contiguous ranges like "5.0–6.8" + "6.8–8.5", produces "5.0–8.5".
 * For a single non-range selection (e.g. "doesn't matter"), returns that value.
 */
function buildMergedValue(optionsContainer) {
  const buttons = optionsContainer.querySelectorAll(
    ".dc-option.dc-selected:not(.dc-na)",
  );
  if (buttons.length === 0) return "n/a";

  const rangePattern = /^([\d.]+)\s*[–—-]\s*([\d.]+)$/;
  const rangeValues = [];
  let nonRangeValue = null;

  buttons.forEach((b) => {
    const match = b.dataset.value.trim().match(rangePattern);
    if (match) {
      rangeValues.push({ low: parseFloat(match[1]), high: parseFloat(match[2]) });
    } else {
      nonRangeValue = b.dataset.value;
    }
  });

  // If only non-range values selected (e.g. "doesn't matter"), return as-is
  if (rangeValues.length === 0 && nonRangeValue) return nonRangeValue;

  // Merge contiguous ranges: take min of all lows, max of all highs
  if (rangeValues.length > 0) {
    const minVal = Math.min(...rangeValues.map((r) => r.low));
    const maxVal = Math.max(...rangeValues.map((r) => r.high));
    // Format to match original precision
    const fmt = (v) => (v % 1 === 0 ? v.toFixed(1) : String(v));
    return `${fmt(minVal)}–${fmt(maxVal)}`;
  }

  return nonRangeValue || "n/a";
}

/**
 * Delegated click handler for .dc-option buttons and the
 * "Update recommendations" button rendered inside assistant messages.
 *
 * Option clicks:
 *   For range questions (numeric range options like "5.0–6.8"):
 *     - Supports multi-select of CONTIGUOUS options.
 *     - Clicking a non-adjacent option deselects all others and selects only the new one.
 *     - Clicking an already-selected option toggles it off (if removal keeps selection contiguous).
 *     - The merged range is POSTed to /api/choice.
 *   For non-range questions:
 *     - Single-select (radio-button behavior as before).
 *   Clicking "n/a" always deselects all others.
 *   Clicking any real option deselects "n/a".
 *
 * "Update recommendations" button:
 *   Sends a message to the LLM with all current choices so it can
 *   retrieve them via get_pending_choices, build transforms, and re-run
 *   the model.
 */
chatMessages.addEventListener("click", async (e) => {
  // ── Handle option button clicks ──
  const btn = e.target.closest(".dc-option");
  if (btn && sessionId) {
    const questionId = btn.dataset.questionId;
    const value = btn.dataset.value;
    if (!questionId || !value) return;

    const parent = btn.closest(".dc-options");
    if (!parent) return;

    const naBtn = parent.querySelector(".dc-na");
    const isNa = btn.classList.contains("dc-na");
    const isRange = isRangeQuestion(parent);

    if (isNa) {
      // Clicking n/a: deselect everything, select n/a
      parent
        .querySelectorAll(".dc-option")
        .forEach((b) => b.classList.remove("dc-selected"));
      btn.classList.add("dc-selected");
    } else if (isRange) {
      // ── Multi-select contiguous logic for range questions ──
      const rangeButtons = Array.from(
        parent.querySelectorAll(".dc-option:not(.dc-na)"),
      );
      const clickedIdx = rangeButtons.indexOf(btn);

      // Check if this is a "doesn't matter" style text option (first non-n/a option)
      const rangePattern = /^[\d.]+\s*[–—-]\s*[\d.]+$/;
      const isTextOption = !rangePattern.test(value.trim());

      if (isTextOption) {
        // "doesn't matter" — acts like single-select, deselects all others
        parent
          .querySelectorAll(".dc-option")
          .forEach((b) => b.classList.remove("dc-selected"));
        btn.classList.add("dc-selected");
      } else if (btn.classList.contains("dc-selected")) {
        // Already selected — toggle OFF, but only keep the contiguous
        // portion that doesn't include this button. If removing it would
        // split the selection, keep only the larger contiguous side.
        btn.classList.remove("dc-selected");

        // Check if remaining selection is still contiguous
        const remainingSelected = [];
        rangeButtons.forEach((b, i) => {
          if (
            b.classList.contains("dc-selected") &&
            !b.classList.contains("dc-na")
          ) {
            remainingSelected.push(i);
          }
        });

        // If non-contiguous after removal, keep only the larger group
        if (remainingSelected.length > 1) {
          const groups = [];
          let currentGroup = [remainingSelected[0]];
          for (let i = 1; i < remainingSelected.length; i++) {
            if (remainingSelected[i] - remainingSelected[i - 1] === 1) {
              currentGroup.push(remainingSelected[i]);
            } else {
              groups.push(currentGroup);
              currentGroup = [remainingSelected[i]];
            }
          }
          groups.push(currentGroup);

          if (groups.length > 1) {
            // Non-contiguous — keep the largest group
            const largest = groups.reduce((a, b) =>
              a.length >= b.length ? a : b,
            );
            const keepSet = new Set(largest);
            rangeButtons.forEach((b, i) => {
              if (
                b.classList.contains("dc-selected") &&
                !b.classList.contains("dc-na") &&
                !keepSet.has(i)
              ) {
                b.classList.remove("dc-selected");
              }
            });
          }
        }

        // If nothing is selected now, re-select n/a
        const anySelected = parent.querySelector(
          ".dc-option.dc-selected:not(.dc-na)",
        );
        if (!anySelected && naBtn) {
          naBtn.classList.add("dc-selected");
        }
      } else {
        // Not yet selected — check contiguity
        if (wouldBeContiguous(rangeButtons, clickedIdx)) {
          // Contiguous: add to selection
          btn.classList.add("dc-selected");
        } else {
          // Non-contiguous: deselect all range buttons, select only this one
          rangeButtons.forEach((b) => b.classList.remove("dc-selected"));
          btn.classList.add("dc-selected");
        }
        // Deselect n/a and "doesn't matter"
        if (naBtn) naBtn.classList.remove("dc-selected");
        rangeButtons.forEach((b) => {
          if (
            b !== btn &&
            !rangePattern.test(b.dataset.value.trim()) &&
            b.classList.contains("dc-selected")
          ) {
            b.classList.remove("dc-selected");
          }
        });
      }
    } else {
      // ── Single-select for non-range questions ──
      parent
        .querySelectorAll(".dc-option")
        .forEach((b) => b.classList.remove("dc-selected"));
      btn.classList.add("dc-selected");
    }

    // Determine the value to record
    const recordedValue = isRange ? buildMergedValue(parent) : value;

    // Record in session state (fire-and-forget)
    try {
      await fetch(`${API_BASE}/api/choice`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          session_id: sessionId,
          question_id: questionId,
          value: recordedValue,
        }),
      });
    } catch (err) {
      console.error("Failed to record choice:", err);
    }
    return;
  }

  // ── Handle "Update recommendations" button ──
  const rerunBtn = e.target.closest(".dc-rerun-btn");
  if (rerunBtn && sessionId && !isLoading) {
    // Collect a human-readable summary of current selections from the
    // discrete-choice blocks in the same message bubble.
    const bubble = rerunBtn.closest(".message-bubble");
    const choices = [];
    if (bubble) {
      bubble.querySelectorAll(".discrete-choice").forEach((block) => {
        const qEl = block.querySelector(".dc-question");
        const optionsContainer = block.querySelector(".dc-options");
        if (qEl && optionsContainer) {
          // Use buildMergedValue to get the effective value (handles multi-select)
          const val = buildMergedValue(optionsContainer);
          if (val && val !== "n/a") {
            choices.push(`${qEl.textContent.trim()} → ${val}`);
          }
        }
      });
    }

    if (choices.length === 0) {
      // Nothing selected beyond n/a — tell the user
      showError("Select at least one preference above before updating.");
      return;
    }

    // Disable the button to prevent double-clicks
    rerunBtn.disabled = true;
    rerunBtn.textContent = "Updating…";

    const summary = choices.join("; ");
    const msg =
      `[User answered preference questions: ${summary}. ` +
      `Retrieve all pending choices with get_pending_choices, translate to preference transforms, and re-run the model.]`;

    await sendMessage(msg);

    // Re-enable (the message is already sent)
    rerunBtn.disabled = false;
    rerunBtn.textContent = "Update recommendations ▶";
  }
});

// ── Action button click handling ────────────────────────────────────

/**
 * Delegated click handler for {ACTION}...{/ACTION} inline buttons.
 * Sends the action text as a regular user message to the LLM.
 */
chatMessages.addEventListener("click", async (e) => {
  const btn = e.target.closest(".action-btn");
  if (!btn || !sessionId || isLoading) return;

  const actionText = btn.dataset.action;
  if (!actionText) return;

  // Disable the button to prevent double-clicks
  btn.disabled = true;
  btn.classList.add("action-btn-used");

  await sendMessage(actionText);
});

// ── Settings dropdown ───────────────────────────────────────────────

btnSettings.addEventListener("click", (e) => {
  e.stopPropagation();
  const isOpen = settingsMenu.style.display !== "none";
  settingsMenu.style.display = isOpen ? "none" : "block";
});

// Close dropdown when clicking outside
document.addEventListener("click", (e) => {
  if (!settingsMenu.contains(e.target) && e.target !== btnSettings) {
    settingsMenu.style.display = "none";
  }
});

// Prevent dropdown from closing when interacting with its contents
settingsMenu.addEventListener("click", (e) => {
  e.stopPropagation();
});

// ── Auto-start a transparent session on page load ───────────────────
createSession("snowboards", "transparent");

modelSelect.addEventListener("change", async () => {
  if (!sessionId) {
    showError("No active session — create a session first.");
    modelSelect.value = "claude-opus-4-6";
    return;
  }

  const newModel = modelSelect.value;
  try {
    const res = await fetch(
      `${API_BASE}/api/session/${sessionId}/settings`,
      {
        method: "PATCH",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ model: newModel }),
      },
    );
    const data = await res.json();
    if (data.error) {
      showError("Failed to update model: " + data.error);
      return;
    }
    // Confirm to user in chat
    appendMessage("user", `[Settings] Switched model to ${newModel}`);
    settingsMenu.style.display = "none";
  } catch (err) {
    showError("Failed to update model: " + err.message);
  }
});

// ── Log level selector ──────────────────────────────────────────────

const logLevelSelect = document.getElementById("log-level-select");

// Fetch current log level on page load
(async function fetchCurrentLogLevel() {
  try {
    const res = await fetch(`${API_BASE}/api/log-level`);
    if (res.ok) {
      const data = await res.json();
      if (data.level && logLevelSelect) {
        logLevelSelect.value = data.level;
      }
    }
  } catch (_) {
    // Silently ignore — default "info" is fine
  }
})();

logLevelSelect.addEventListener("change", async () => {
  const newLevel = logLevelSelect.value;
  try {
    const res = await fetch(`${API_BASE}/api/log-level`, {
      method: "PUT",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ level: newLevel }),
    });
    const data = await res.json();
    if (data.error) {
      showError("Failed to set log level: " + data.error);
      return;
    }
    // Brief confirmation in chat
    appendMessage("user", `[Settings] Server log level set to ${newLevel}`);
    settingsMenu.style.display = "none";
  } catch (err) {
    showError("Failed to set log level: " + err.message);
  }
});
