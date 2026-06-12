# Automation (macOS / launchd)

Two scheduled jobs keep the security vault current with a headless `claude -p` runner:

- **`nightly-secondbrain-journal`** (`run-nightly.sh`, daily 16:09) — pulls meetings,
  Slack, email, and Claude sessions into a daily journal, and runs the **task-rollup
  completion-evidence engine** that auto-closes finished action items.
- **`weekly-security-coach`** (`run-weekly-coach.sh`, Friday 16:09) — an honest
  security-career coaching report, with a monthly LinkedIn + resume pass.

## Setup

1. Copy the runners and prompts to your automation home:
   ```bash
   mkdir -p ~/.secondbrain/logs
   cp run-nightly.sh run-weekly-coach.sh nightly-prompt.md weekly-coach-prompt.md ~/.secondbrain/
   chmod +x ~/.secondbrain/run-nightly.sh ~/.secondbrain/run-weekly-coach.sh
   ```
2. Edit the prompts to replace `[NAME]`, `[EMAIL]`, `[ROLE]`, `[ORG]` and your program names.
3. Copy the plists to `~/Library/LaunchAgents/` and load them:
   ```bash
   cp com.example.secondbrain-*.plist ~/Library/LaunchAgents/
   launchctl bootstrap "gui/$(id -u)" ~/Library/LaunchAgents/com.example.secondbrain-nightly.plist
   launchctl bootstrap "gui/$(id -u)" ~/Library/LaunchAgents/com.example.secondbrain-coach.plist
   ```

## Config (env, overridable)

| Var | Default | Purpose |
|-----|---------|---------|
| `SECONDBRAIN_HOME` | `~/.secondbrain` | runner + prompts + logs |
| `SECONDBRAIN_VAULT` | `~/SecondBrain` | the vault root |
| `CLAUDE` | `$(command -v claude)` | path to the claude binary |
| `MODEL` | `sonnet` | model for the headless run |
| `BUDGET_USD` | `5` / `3` | per-run spend cap |

## Smoke test (no API spend)

Point `CLAUDE` at a stub that echoes, to verify the harness (lock, killswitch, logging,
vault `cd`, prompt assembly) without calling the real model:

```bash
printf '#!/bin/bash\necho "[stub claude] args: $*" | head -c 200\n' > /tmp/claude-stub
chmod +x /tmp/claude-stub
CLAUDE=/tmp/claude-stub SECONDBRAIN_HOME=~/.secondbrain SECONDBRAIN_VAULT=~/SecondBrain \
  bash run-nightly.sh
```

A real run just drops the `CLAUDE=` override. Killswitch: `touch ~/.secondbrain/STOP`.

> **Headless MCP caveat:** OAuth-based MCPs (Slack, Atlassian) work in headless `claude -p`
> via the keychain. Connector-style MCPs tied to an interactive login (some meeting/email
> connectors) may be absent in a launchd run — verify your first real run.
