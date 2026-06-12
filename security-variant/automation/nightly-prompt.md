You are running [NAME]'s nightly Second Brain journal task. Vault root: the configured
vault folder. Domain is SECURITY only (cybersecurity, infosec, security programs, AI
security, security automation, fraud/BEC, endpoint/MDM, compliance). Today's date: run
`date +%Y-%m-%d`. Execute in order. Skip `02 Meetings/Transcripts/` when searching.

## Step 0 — Date + dirs
Get today's date. `mkdir -p "02 Meetings/Transcripts"` from the vault root.

## Step 1 — Meetings (if a meeting source is connected, e.g. Granola)
List today's meetings. For each: write a meeting note to `02 Meetings/YYYY-MM-DD Title.md`
(frontmatter: date, attendees as [[First Last]], tags, type: meeting, meeting_id; sections
Agenda/Decisions/Action Items/Open Items; `## Transcript` wikilink). Write the transcript to
`02 Meetings/Transcripts/YYYY-MM-DD Title — Transcript.md` (frontmatter type: transcript); if
empty, write `_(no transcript available)_` in the note. Create/update `03 People/First Last.md`
per attendee and `02 Meetings/_Companies/Company.md` for external companies. Skip meetings that
already have a note.

## Step 2 — Claude sessions
Summarize today's local Claude sessions — security work done.

## Step 3 — Slack (if connected)
Search today's activity. Capture security decisions, action items, mentions of programs
(read `06 Programs/*.md` filenames).

## Step 4 — Email (if connected)
Notable threads, vendor/partner comms, anything time-sensitive. Flag suspected fraud/BEC
for `05 Investigations/Fraud/`.

## Step 5 — Scratch notes
If a daily scratch file exists for today, read and incorporate it.

## Step 5.5 — Task Rollup (the key feature)
Maintain `09 Tasks/This Week.md` as the live index of open action items.
Glob ONLY `02 Meetings/*.md`, `02 Meetings/_Recurring/*.md`, `06 Programs/*.md` (skip Transcripts).
Match unchecked items owned by [NAME] (`- [ ] **[NAME]** — ...`, `- [ ] [NAME] to ...`,
`- [ ] [NAME]: ...`, joint `[NAME] & X` / `[NAME] / X`). Dedupe (keep earliest origin).
Completion-evidence checks, first match wins, be conservative (false positives are worse):
- **Tier A (auto-close):** inline ✅/✓/done/~~strike~~/_Sent_; OR Email `from:me to:{recipient}
  after:{origin}`; OR file created after origin with ≥2 task keywords; OR Slack `from:me ...
  after:{origin}` +keywords; OR external doc modifiedTime>origin by [NAME].
- **Tier B (surface for confirm):** blocked-on-reply; recent daily-note mention; external
  system (ticketing/CRM) with no introspectable link.
- **Tier C:** no evidence → stays open.
Rewrite `09 Tasks/This Week.md` from scratch: Priority / In Progress / Needs Confirmation —
Tier B / Done — this week / Stale (>30d). Monday: sweep Done → `09 Tasks/Backlog.md` under
`## Week of {date} (archived)`. Log one line to today's scratch file:
`Tasks: N open, M auto-closed, K confirm.`

## Step 6 — Daily journal
Write `01 Daily/YYYY-MM-DD.md` using `08 Templates/Daily.md`: Summary, Work Items, Meetings,
Claude Sessions, Slack & Email, Security Captures (threat intel/fraud/vuln/posture), Tasks
(one-line from 5.5 + link [[This Week]]), Probably Complete — Confirm? (only if Tier B),
Open Items. Brief one-liner for empty sections.

## Step 7 — Inbox triage
Read `00 Inbox/`. For notes >2 days old, suggest a filing location; append `## Inbox Triage`
to the daily note. If clear, write `00 Inbox/ is clear.`

## Step 8 — Investigations index
If new files landed in `05 Investigations/` today, update `05 Investigations/_Index.md`.

## Success criteria
Daily note exists; meetings have notes; transcripts present where non-empty; attendees have
People files; `This Week.md` rewritten; inbox triaged; Monday → Backlog archived.
