# 0001 — Skills repository architecture

- Status: accepted
- Date: 2026-06-19

## Context

A personal collection of agent skills, spanning personal / engineering / learning
domains, that should be installable across machines and possibly shared publicly.
Designed in two grilling sessions, using [`mattpocock/skills`](https://github.com/mattpocock/skills)
as the reference structure.

## Decisions

### Distribution

1. **Single Claude Code plugin**, not multiple plugins. Categories are *subfolders*
   under `skills/`, and the `skills` array in `.claude-plugin/plugin.json` is the
   ship-list. Selective exposure is achieved by omitting buckets from that array,
   not by separate installs.
2. **Both install paths supported**: native Claude Code marketplace
   (`.claude-plugin/marketplace.json` → `/plugin marketplace add jabirhussainturi/skills`)
   and `skills.sh` (`npx skills add jabirhussainturi/skills`). Local development uses
   `scripts/link-skills.sh`.
3. Names: repo `skills`, plugin + marketplace both `jabir-skills`.
4. License: **MIT**. Repo is **public**.

### Structure

5. **Buckets.** Shipped: `engineering`, `personal`, `learning`. Parked:
   `in-progress`, `deprecated`. ("Personal" here is a *content* bucket that ships —
   unlike the reference, where personal means "not promoted".)
6. **Governance.** The ship-list invariant (see `CLAUDE.md`): shipped skills appear
   in both their bucket README and `plugin.json`; parked skills appear in neither.
7. Full scaffolding adopted: top + per-bucket READMEs, `CLAUDE.md`, `CONTEXT.md`,
   `docs/adr/`, `.out-of-scope/`, `scripts/`.

### Seeding

8. Two skills seed the repo:
   - `write-a-skill` (`engineering/`, shipped) — the bootstrap authoring skill;
     exercises the ship-list invariant end-to-end.
   - `write-article` (`in-progress/`, parked) — a multi-platform article writer
     (see below); lands in `in-progress/` until proven, then promotes to `personal/`.

## `write-article` — design decisions

- **Transforms the user's source material** (notes file primary; codebase path and
  conversation context as boosters) — it automates *production*, not *thinking*.
- **Canonical-then-adapt**: one master article → deterministic per-platform adapters
  (Medium, LinkedIn, Dev.to, X thread, blog MDX), on an extensible adapter pattern.
- **Voice** is layered: a built-in anti-slop pass (always on) + a persistent
  `voice.md` profile, seeded from the user's samples or a short calibration.
- **Diagrams** authored as Mermaid source, rendered to SVG/PNG via `mmdc`; Dev.to
  keeps the Mermaid source.
- **Files only** — no API publishing (Medium's posting API is retired; LinkedIn's is
  gated). Output is paste-perfect artifacts.
- **Three review gates** (angle → canonical+voice → diagrams), then auto-adapt, with
  an `--auto` flag to skip gates.
- **Layout**: persistent `voice.md` at the workspace root; self-contained
  `articles/<slug>/` per run; output root asked once and remembered.

## Consequences

- Adding a skill is a three-file change (skill folder + a README line + a `plugin.json`
  entry, for shipped skills) — enforced by the invariant.
- Promoting `write-article` is a `git mv` + two lines once it passes a live run.
- The repo can grow to many skills and multiple machines without restructuring.
