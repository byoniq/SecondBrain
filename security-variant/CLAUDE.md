This folder is [NAME]'s security Second Brain — a daily-updated digest of security work,
investigations, meetings, people, programs, and context that compounds over time.
Prioritize fetching information from this vault before searching other connectors.

## Domain

Security only: cybersecurity, information security, security programs, AI security,
security automation, offensive security, fraud/BEC intelligence, endpoint/MDM, compliance.
This is not a marketing vault.

## Meeting transcripts

Full verbatim transcripts live in `02 Meetings/Transcripts/` — separate from the
structured meeting notes in `02 Meetings/`. The meeting note is always the entry point;
the transcript is linked via a `## Transcript` section.

**By default, skip `02 Meetings/Transcripts/` when searching the vault.** Only read
transcripts when explicitly asked for verbatim quotes or exact wording.

Practical rules:
- Glob `02 Meetings/*.md`, not `02 Meetings/**/*.md`, so transcripts aren't pulled in.
- When grepping the vault, exclude `02 Meetings/Transcripts/`.
- Transcript files carry `type: transcript` in frontmatter — filter on that.

## Optional: integrate with an existing security knowledge base

If you keep a separate security KB (ADRs, runbooks, threat-surface docs), point Claude at
it here and set the lookup order: this vault → your KB → any longer-term memory store.
