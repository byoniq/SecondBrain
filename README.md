<div align="center">

# 🧠 SecondBrain

**An Obsidian Second Brain that rewrites itself.**

*One source in — the vault links it, propagates the facts, and synthesizes across everything you already know.*

[![Second Brain](https://img.shields.io/badge/Second%20Brain-44%20commands-10b981)](https://github.com/eugeniughelbur/obsidian-second-brain)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-skill-f97316)](https://github.com/byoniq/SecondBrain)

</div>

---

Every note you add should permanently raise the floor of what you know. Second Brain takes new input and weaves it into your Obsidian vault — propagating facts and synthesizing across everything already captured — so the vault compounds instead of just growing.

```
capture ──► ingest ──► synthesize ──► compound
```

## What's inside

| | Subdir | What it is |
|--|--------|------------|
| 🗃️ | [`second-brain/`](second-brain/) | Claude Code skill for AI-first Obsidian vault management. 44 slash commands for ingestion, synthesis, and vault rewriting. *One URL in, the vault rewrites itself.* |
| 🛡️ | [`security-variant/`](security-variant/) | A data-free, security-team adaptation: Investigations/Programs/Coach structure, a generic security `SKILL.md`, and launchd nightly-journal + weekly career-coach automation with a task-rollup completion-evidence engine. |

## Quick start

```bash
# Install the Second Brain skill into Claude Code
cd second-brain && ./install.sh
```
The installer symlinks the slash commands into `.claude/` so they're available in any Claude Code session opened in your vault.

**Apply the security-team variant (optional):**
1. Build the folder structure from [`security-variant/structure.md`](security-variant/structure.md)
2. Copy `security-variant/templates/*` into `08 Templates/`
3. Copy `security-variant/SKILL.md` → `.claude/skills/second-brain/SKILL.md` (fill in placeholders)
4. Copy `security-variant/CLAUDE.md` → your vault root
5. Wire the nightly + weekly automation per [`security-variant/automation/README.md`](security-variant/automation/README.md)

## Keeping up to date

`second-brain/` vendors [eugeniughelbur/obsidian-second-brain](https://github.com/eugeniughelbur/obsidian-second-brain) with unmodified source. Pull upstream into the subdir:

```bash
cd second-brain && git pull https://github.com/eugeniughelbur/obsidian-second-brain.git main
# Then re-run install.sh to refresh the skill files
```

## License

`second-brain/` keeps its own license — see [`second-brain/LICENSE`](second-brain/LICENSE). Check the upstream repo before redistributing.

> **Note:** this repo previously bundled DeepScientist (an autonomous research studio). It was removed on 2026-06-12; SecondBrain is now the Obsidian vault toolkit alone.
