---
name: second-brain
description: >
  [NAME]'s security Second Brain (Obsidian + Claude). Use this skill at the start of
  EVERY session and whenever you need context about [NAME]'s security work, programs,
  investigations, colleagues, meetings, or prior decisions. This is your FIRST STOP
  before asking [NAME] questions — the answer is probably already in the vault. Do not
  ask [NAME] to re-explain documented things. USE WHEN: what am I working on, what's on
  my plate, who is X, status of <program>, prior decision, meeting recap, daily journal,
  second brain, my vault.
---

# Second Brain (Security)

[NAME]'s security knowledge vault is Obsidian-native markdown. Domain is SECURITY only:
cybersecurity, infosec, security programs, AI security, security automation, offensive
security, fraud/BEC, endpoint/MDM, compliance.

## The Rule

**Check the vault before asking [NAME].** If context genuinely doesn't exist:
1. Ask [NAME] directly.
2. Append a context-gap note to today's daily entry (`01 Daily/YYYY-MM-DD.md`):
   ```
   ## Context Gap Flagged
   - **Topic:** [what was missing]
   - **What [NAME] said:** [brief summary]
   - **Suggested location:** [where in the vault this should live]
   ```

## Who the user is

[NAME] · [EMAIL] · [ROLE] at [ORG]. For deeper context read `Context/`, `06 Programs/`,
`03 People/`, `04 Teams/`.

## Vault structure — when to read each folder

- `00 Inbox/` — when [NAME] says "I dropped a note about this"
- `01 Daily/` — start of every session, skim last 2–3 entries
- `02 Meetings/` — when a meeting or decision is mentioned. Glob `02 Meetings/*.md` only
- `02 Meetings/_Recurring/` — recurring 1:1s / syncs needing running context
- `02 Meetings/Transcripts/` — only when verbatim quotes are requested
- `03 People/` — when someone is mentioned by name
- `04 Teams/` — working with a specific internal team
- `05 Investigations/` — Fraud / Threats / Pentest. Before any fraud-triage or threat work
- `06 Programs/` — your security programs — canonical program state
- `07 Resources/` — runbooks, tool docs, references
- `08 Templates/` — when creating a new meeting/person/program/investigation/daily note
- `09 Tasks/This Week.md` — start of every session, or "what's on my plate"
- `09 Tasks/Backlog.md` — prior weeks / back-burner ideas
- `10 Coach/` — weekly security-career coaching reports (incl. LinkedIn/resume reviews)
- `Context/` — evergreen self-description, goals, org context

## Session-start orientation

1. Skim the last 2–3 entries in `01 Daily/`
2. Glance at `09 Tasks/This Week.md`
3. Then wait for the request and pull specific files on demand. Don't preload everything.

## Key people

_(Fill in a table: Name / Role / Team / File path in `03 People/`.)_

## Active programs

_(Fill in a table: Program / File path in `06 Programs/`.)_

## Nightly task note

A scheduled task `nightly-secondbrain-journal` runs daily and writes
`01 Daily/YYYY-MM-DD.md`, rewrites `09 Tasks/This Week.md`, and archives closed tasks to
`09 Tasks/Backlog.md` on Mondays. `weekly-security-coach` runs Fridays and writes
`10 Coach/coach-YYYY-MM-DD.md`. See `automation/` for the launchd setup.
