# Integration: DeepScientist → Second Brain

DeepScientist produces research sessions. Second Brain consumes them. This directory holds the configuration and conventions that connect the two so a finished research session flows into your Obsidian vault without manual copying.

The conceptual model is a handoff. DeepScientist owns *investigation* — it writes a structured session (findings, sources, claims) to its output directory. Second Brain owns *knowledge* — it reads that session, files it into the vault, links it against prior notes, and synthesizes the result. The integration is just making DeepScientist write where Second Brain reads.

## Runtime wiring

Copy `config.example` to `config.yaml` and fill in your paths. The one wiring decision that matters: set `deepscientist.research_output_dir` equal to `second_brain.ingest_inbox`. When those two paths point at the same directory, DeepScientist writes research sessions directly into the folder Second Brain watches — a zero-copy research-to-vault pipeline.

If you prefer to keep raw research separate from the vault, leave the paths distinct and copy or symlink sessions into the inbox when you're ready to ingest.

## Workflow example

1. **Research.** Start the daemon (`ds start`) and run a query: `ds run "How are LLM eval harnesses handling contamination in 2026?"`
2. **Output lands.** DeepScientist writes the structured session to `~/research-output/` (its `research_output_dir`).
3. **Ingest.** From a Claude Code session opened in your vault, run `/obsidian-ingest`. Second Brain reads the session from the inbox, extracts claims and sources, and files the note.
4. **Synthesize and propagate.** Run `/obsidian-synthesize`. Second Brain links the new note to related pages, reconciles it against existing knowledge, and rewrites affected notes so the new facts propagate across the vault.

## Useful Second Brain commands for DS output

| Command | Use it to |
|---------|-----------|
| `/obsidian-ingest` | Pull a DeepScientist session from the inbox into the vault as a structured note. |
| `/obsidian-synthesize` | Propagate the new facts into related notes and reconcile contradictions. |
| `/obsidian-research` | Kick off vault-side research that builds on an ingested session. |
| `/obsidian-morning-briefing` | Roll up everything ingested and synthesized recently into a daily briefing. |

Start with `/obsidian-ingest` then `/obsidian-synthesize` — that pair is the core loop. The other two are for following up once the session is in the vault.
