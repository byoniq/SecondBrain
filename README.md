# SecondBrain

A research operating system. DeepScientist does the heavy investigative lift — autonomous, multi-source, deep — and Second Brain takes that output and weaves it into your Obsidian vault, propagating facts and synthesizing across everything you already know. The point isn't two tools sitting next to each other; it's a single loop where every question you ask permanently raises the floor of what your vault knows: **query → research → synthesize → compound.**

## What's inside

| Subdir | What it is |
|--------|------------|
| [`deepscientist/`](deepscientist/) | Autonomous research studio — Python daemon + React UI + `ds` CLI. Takes a research question and runs deep multi-source investigation across pluggable AI backends (Codex, Claude, Kimi, OpenCode), producing structured output. Runs entirely locally. |
| [`second-brain/`](second-brain/) | Claude Code skill for AI-first Obsidian vault management. 44 slash commands for research ingestion, synthesis, and vault rewriting. Core loop: *one URL in, the vault rewrites itself.* |
| [`integration/`](integration/) | The glue. Config example and a technical guide for wiring DeepScientist's output directory into Second Brain's ingest path so research flows into the vault without manual copying. |

## How they work together

DeepScientist and Second Brain solve two different halves of the same problem. DeepScientist is built to *find* — it fans out across sources, reasons over them, and emits a structured research session. Second Brain is built to *remember and connect* — it ingests that session, links it to prior notes, propagates new facts into the notes they affect, and synthesizes the result back into your knowledge graph.

Run them in sequence and you get a compounding loop. Each research session doesn't just answer the question in front of you; it updates everything related that you've ever captured.

The three-step workflow:

1. **Research.** `ds run "What changed in EU AI Act enforcement in 2026?"` — DeepScientist investigates and writes a structured session to its output directory.
2. **Ingest.** From a Claude Code session in your vault, run `/obsidian-ingest` against that output. Second Brain pulls the session in, extracts claims, and files it.
3. **Synthesize.** `/obsidian-synthesize` propagates the new facts into related notes, resolves contradictions with existing knowledge, and rewrites affected pages. Your vault is now smarter than it was before you asked.

## Quick Start

1. **Install DeepScientist and start the daemon:**
   ```bash
   npm install -g @researai/deepscientist && ds start
   ```
2. **Install the Second Brain skill into your vault:**
   ```bash
   cd second-brain && ./install.sh
   ```
   The installer drops the skill files into `.claude/` so the slash commands become available in Claude Code sessions opened in that vault.
3. **Point DeepScientist's output at your vault.** Copy the integration config and set DeepScientist's research output directory to your vault's ingest inbox:
   ```bash
   cp integration/config.example integration/config.yaml
   # edit config.yaml — set deepscientist.research_output_dir to second_brain.ingest_inbox
   ```
   See [`integration/README.md`](integration/README.md) for the full wiring guide.
4. **Run the loop:** `ds run "<your question>"`, then `/obsidian-ingest` and `/obsidian-synthesize` from your vault.

## Keeping up to date

Each tool tracks its own upstream. Pull changes per subdir — don't pull at the root, since the two upstreams are independent repos vendored side by side here.

DeepScientist:
```bash
cd deepscientist && git pull https://github.com/ResearAI/DeepScientist.git main
```

Second Brain:
```bash
cd second-brain && git pull https://github.com/eugeniughelbur/obsidian-second-brain.git main
```

After pulling Second Brain, re-run `./install.sh` to refresh the installed skill files in `.claude/`.

## License

Each tool keeps its own license in its own subdir — see `deepscientist/LICENSE` and `second-brain/LICENSE`. The integration glue in `integration/` is provided as-is. Check the respective upstream repos for the authoritative terms before redistributing.
