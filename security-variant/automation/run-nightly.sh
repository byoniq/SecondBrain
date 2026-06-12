#!/bin/bash
# Nightly Second Brain journal runner — headless `claude -p`.
# Invoked by launchd (com.example.secondbrain-nightly) daily, or manually for a smoke test.
# Single-instance lock, killswitch, logging.
set -euo pipefail

ROOT="${SECONDBRAIN_HOME:-$HOME/.secondbrain}"
VAULT="${SECONDBRAIN_VAULT:-$HOME/SecondBrain}"
PROMPT_FILE="$ROOT/nightly-prompt.md"
LOCKDIR="$ROOT/.lock-nightly"
STOP="$ROOT/STOP"
LOG="$ROOT/logs/nightly-$(date +%Y%m%d-%H%M%S).log"
CLAUDE="${CLAUDE:-$(command -v claude || echo "$HOME/.local/bin/claude")}"   # overridable
MODEL="${MODEL:-sonnet}"
BUDGET_USD="${BUDGET_USD:-5}"

export PATH="$HOME/.local/bin:/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
unset ANTHROPIC_API_KEY   # OAuth MCPs (keychain); avoid "multiple providers" error

mkdir -p "$ROOT/logs"
exec > >(tee -a "$LOG") 2>&1
echo "=== secondbrain-nightly run $(date) (model=$MODEL, budget=\$$BUDGET_USD) ==="

[[ -e "$STOP" ]] && { echo "KILLSWITCH present ($STOP) — aborting."; exit 0; }
if ! mkdir "$LOCKDIR" 2>/dev/null; then echo "Another run holds the lock — exiting."; exit 0; fi
trap 'rmdir "$LOCKDIR" 2>/dev/null || true' EXIT

[[ -x "$CLAUDE" ]]      || { echo "ERROR: claude CLI not found/executable at $CLAUDE"; exit 1; }
[[ -f "$PROMPT_FILE" ]] || { echo "ERROR: prompt missing at $PROMPT_FILE"; exit 1; }
[[ -d "$VAULT" ]]       || { echo "ERROR: vault not found at $VAULT"; exit 1; }

HEADER="RUN CONTEXT: today=$(date +%Y-%m-%d). Vault root: $VAULT. Follow the task below exactly."
PROMPT="$HEADER

$(cat "$PROMPT_FILE")"

cd "$VAULT"
"$CLAUDE" -p "$PROMPT" \
  --model "$MODEL" \
  --permission-mode bypassPermissions \
  --max-budget-usd "$BUDGET_USD" \
  --output-format text

echo "=== secondbrain-nightly run complete $(date) ==="
