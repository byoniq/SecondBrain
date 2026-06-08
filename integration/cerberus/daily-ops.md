# Cerberus Daily Ops

> Source of truth: `~/.claude/PAI/skills/cerberus-begin/SKILL.md` and `~/security-context/runbooks/cerberus-daily-ops.md`
> This file is the SecondBrain mirror — updated as the system evolves.

## What It Is

Parallel daily orchestration for the Workstream Cerberus security program. Say **"Let's Begin"** in Claude Code → 8 subsystems checked in parallel → prioritized brief in ~30s.

## Programs Covered

| Program | Source | Frequency |
|---------|--------|-----------|
| Jira SEC | Jira API | Daily |
| Dependabot | GitHub Security API | Daily |
| Drata SOC 2 | Drata API | Daily |
| Kandji MDM | Kandji API | Daily |
| FraudWatch | KB files | Daily |
| Shodan | Shodan API | Daily |
| Threat Intel (NVD CVEs) | NVD API | Daily |
| Shannon Done Review | Shannon state.json | Weekdays |
| GitHub Alerts | GitHub API | Daily |
| Tool Versions | npm/GitHub | Weekly (Mon) |

## Automation Phases

| Phase | Status | Description |
|-------|--------|-------------|
| 1 — Human Review | **ACTIVE (2026-06-08)** | All checks auto; write actions need approval |
| 2 — Automated with Gates | Target Q3 2026 | Morning preview, mid-day check-in, EOD summary |
| 3 — Full Autonomy | Target Q4 2026 | Weekly digest; P0/fraud always surfaces immediately |

## Pulse Infrastructure

5 scheduled jobs added to `~/.claude/PAI/Pulse/PULSE.toml` on 2026-06-08:

- `cerberus-shannon-done-review` — weekdays 08:00 PT
- `cerberus-threat-intel` — daily 07:00 PT  
- `cerberus-github-check` — daily 07:30 PT
- `cerberus-tool-refresh` — Monday 09:00 PT
- `cerberus-eod-summary` — weekdays 17:00 PT

## Hard Rules

- **NEVER trigger Shannon scans** — quarterly cadence only
- Phase 1: all write actions need `[APPROVE]` / `[DEFER]` / `[MODIFY]`
- Jira: P0-Critical / P1-High / P2-Medium / P3-Low
- FraudWatch: always push to BOTH helloworld1812/fraud-watch AND byoniq/fraud-watch
