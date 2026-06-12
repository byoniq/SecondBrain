# Security Variant

A security-team adaptation of the Second Brain. The default Second Brain vault is
shaped for general/marketing knowledge work; this variant re-shapes it for
**security practitioners** — cybersecurity, information security, security programs,
AI security, security automation, offensive security, fraud/BEC intelligence,
endpoint/MDM, and compliance.

## What's different from the default vault

| Default | Security variant |
|---------|------------------|
| `05 Intelligence/` (Competitors, ICP, Campaigns) | `05 Investigations/` (Fraud, Threats, Pentest) |
| `06 Projects/` | `06 Programs/` (your security programs) |
| `04 Departments/` | `04 Teams/` (internal teams you partner with) |
| `10 Career Coach/` (growth) | `10 Coach/` (security-career: visibility, impact, LinkedIn/resume) |

Everything else (Daily, Meetings + Transcripts, People, Templates, Tasks, Context,
the nightly task, and the task-rollup engine) carries over unchanged.

## Contents

- `SKILL.md` — generic security-domain Second Brain skill (drop in `.claude/skills/second-brain/`)
- `CLAUDE.md` — vault-root rules for a security vault
- `structure.md` — the folder layout
- `templates/` — Meeting, Person, Program, Investigation, Daily note templates
- `automation/` — launchd nightly-journal + weekly-coach runners, prompts, and plists,
  plus the **task-rollup completion-evidence engine** (the most useful part)

## Install

1. Create the folder structure from `structure.md` in your vault.
2. Copy `templates/` into `08 Templates/`.
3. Copy `SKILL.md` to `.claude/skills/second-brain/SKILL.md` and fill in the placeholders.
4. Copy `CLAUDE.md` to your vault root.
5. (Optional automation) See `automation/README.md` to wire the nightly + weekly jobs
   via launchd (macOS) using a headless `claude -p` runner.

> All files here are **placeholder-only** — replace `[NAME]`, `[EMAIL]`, `[ORG]`, and the
> example program/people names with your own. No real data ships in this variant.
