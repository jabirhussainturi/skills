# jabir-skills

A collection of agent skills (slash commands and behaviors) loaded by Claude Code and compatible agents. Skills are organized into buckets and distributed as a single plugin.

## Language

**Skill**:
A self-contained unit of agent capability — a folder with a `SKILL.md` (frontmatter + instructions) plus optional supporting files. Invoked by its `name:` (e.g. `/write-article`).

**Bucket**:
A top-level folder under `skills/` that groups skills. Either **shipped** (`engineering`, `personal`, `learning`) or **parked** (`in-progress`, `deprecated`).
_Avoid_: category, folder (when precision matters).

**Shipped / parked**:
A skill is **shipped** if it installs via the plugin (listed in `plugin.json` + a README). A skill is **parked** if it lives in the repo but never installs. The state is determined by which bucket the skill is in.

**Ship-list**:
The `skills` array in `.claude-plugin/plugin.json`. The single source of truth for what installs. Kept in sync with the bucket READMEs by the invariant in `CLAUDE.md`.

**Promotion**:
Moving a skill from `in-progress/` into a shipped bucket, adding it to the ship-list and READMEs. The moment a draft becomes installable.

## Terms used by the `write-article` skill

**Canonical (article)**:
The single master article (markdown, with diagrams and full argument) that all platform variants are derived from. Reviewed once; never published directly.

**Adapter**:
A per-platform spec that deterministically transforms the **canonical** into one platform's output file (Medium, LinkedIn, Dev.to, X thread, blog MDX). Adding a platform = adding an adapter.

**Voice profile**:
The persistent `voice.md` the user maintains, read on every run, that makes drafts sound like the user (as opposed to the built-in anti-slop rules, which only make drafts *not* sound like a bot).
