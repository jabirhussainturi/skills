# jabir-skills — repository rules

A collection of agent skills, organized into bucket folders under `skills/`.

## Buckets

**Shipped** (installable via the plugin):

- `engineering/` — daily code and tooling work
- `personal/` — personal workflow and content tools
- `learning/` — skills that help me learn things (explain, quiz, study)

**Parked** (in the repo, but never installed):

- `in-progress/` — drafts not yet ready to ship; usable locally via `scripts/link-skills.sh`
- `deprecated/` — retired skills, kept for reference; not linked, not shipped

## The ship-list invariant

This is the load-bearing rule that keeps `plugin.json` honest. Do not break it.

- Every skill in a **shipped** bucket (`engineering/`, `personal/`, `learning/`) **must** appear in **both**:
  1. its bucket's `README.md`, and
  2. the `skills` array in `.claude-plugin/plugin.json`.
- Every skill in a **parked** bucket (`in-progress/`, `deprecated/`) **must** appear in **neither** `plugin.json` **nor** the top-level `README.md`.

When you add, move, promote, or remove a skill, update `plugin.json` and the relevant READMEs in the same change.

## Promotion

To promote a skill from `in-progress/` to a shipped bucket:

1. `git mv skills/in-progress/<skill> skills/<bucket>/<skill>`
2. Add its path to the `skills` array in `.claude-plugin/plugin.json`
3. Add a one-line entry to `skills/<bucket>/README.md` and to the top-level `README.md`

## READMEs

- The top-level `README.md` lists every **shipped** skill, grouped by bucket, each name linked to its `SKILL.md`.
- Each bucket folder has a `README.md` listing its skills (one line each, name linked to `SKILL.md`).

## Other conventions

- One skill per folder; the folder name matches the skill's `name:` frontmatter.
- Skills follow progressive disclosure: a short `SKILL.md` that points at supporting files (`*.md`, `scripts/`) loaded only when needed.
- Record non-obvious architecture decisions in `docs/adr/`.
- Park rejected ideas (and *why* they were rejected) in `.out-of-scope/`.
- New or confusing domain terms go in `CONTEXT.md`.
