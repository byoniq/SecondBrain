<div align="center">

# 🧠 SecondBrain

**A research operating system built on two open-source tools.**

*DeepScientist investigates. Second Brain remembers. Together they compound.*

[![License](https://img.shields.io/badge/license-see%20subdirs-blue)](#license)
[![DeepScientist](https://img.shields.io/badge/DeepScientist-v1.6.0-8b5cf6)](https://github.com/ResearAI/DeepScientist)
[![Second Brain](https://img.shields.io/badge/Second%20Brain-44%20commands-10b981)](https://github.com/eugeniughelbur/obsidian-second-brain)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-skill-f97316)](https://github.com/byoniq/SecondBrain)

</div>

---

Every question you ask should permanently raise the floor of what you know. DeepScientist does the heavy investigative lift — autonomous, multi-source, deep — and Second Brain takes that output and weaves it into your Obsidian vault, propagating facts and synthesizing across everything you already know.

```
query ──► research ──► ingest ──► synthesize ──► compound
           (DS)                    (Second Brain)
```

## What's inside

| | Subdir | What it is |
|--|--------|------------|
| 🔬 | [`deepscientist/`](deepscientist/) | Autonomous research studio — Python daemon + React UI + `ds` CLI. Runs multi-source deep investigation across pluggable AI backends (Codex, Claude, Kimi, OpenCode). Entirely local. |
| 🗃️ | [`second-brain/`](second-brain/) | Claude Code skill for AI-first Obsidian vault management. 44 slash commands for research ingestion, synthesis, and vault rewriting. *One URL in, the vault rewrites itself.* |
| 🔗 | [`integration/`](integration/) | Config example and wiring guide to route DeepScientist's output directly into Second Brain's ingest path — zero manual copying. |

## How they work together

DeepScientist and Second Brain solve two different halves of the same problem.

**DeepScientist** is built to *find* — it fans out across sources, reasons over them, and emits a structured research session with findings, sources, and claims.

**Second Brain** is built to *remember and connect* — it ingests that session, links it to prior notes, propagates new facts into the notes they affect, and synthesizes the result back into your knowledge graph.

Run them in sequence and you get a compounding loop. Each research session doesn't just answer the question in front of you — it updates everything related that you've ever captured.

```
┌─────────────────────────────────────────────────────────────────┐
│                         THE LOOP                                │
│                                                                 │
│   Ask a question                                                │
│        │                                                        │
│        ▼                                                        │
│   ┌─────────────┐     structured     ┌──────────────────────┐  │
│   │             │─────session───────▶│                      │  │
│   │ DeepScientist│                   │    Second Brain      │  │
│   │  (research) │                   │  (ingest+synthesize) │  │
│   └─────────────┘                   └──────────┬───────────┘  │
│                                                │               │
│                                                ▼               │
│                                        Obsidian vault          │
│                                      (smarter than before)     │
└─────────────────────────────────────────────────────────────────┘
```

## Quick Start

**1. Install DeepScientist**
```bash
npm install -g @researai/deepscientist
ds start
```

**2. Install the Second Brain skill**
```bash
cd second-brain && ./install.sh
```
The installer symlinks 44 slash commands into `.claude/` so they're available in any Claude Code session opened in your vault.

**3. Wire them together**
```bash
cp integration/config.example integration/config.yaml
# Set deepscientist.research_output_dir = second_brain.ingest_inbox
```
See [`integration/README.md`](integration/README.md) for the full guide.

**4. Run the loop**
```bash
ds run "What changed in EU AI Act enforcement in 2026?"
# Then in a Claude Code session in your vault:
# /obsidian-ingest
# /obsidian-synthesize
```

## Keeping up to date

Each tool tracks its own upstream. Pull per subdir — not at root.

```bash
# DeepScientist
cd deepscientist && git pull https://github.com/ResearAI/DeepScientist.git main

# Second Brain
cd second-brain && git pull https://github.com/eugeniughelbur/obsidian-second-brain.git main
# Then re-run install.sh to refresh the skill files
```

## License

Each tool keeps its own license in its subdirectory — see [`deepscientist/LICENSE`](deepscientist/LICENSE) and [`second-brain/LICENSE`](second-brain/LICENSE). The integration glue in [`integration/`](integration/) is provided as-is. Check the respective upstream repos before redistributing.
