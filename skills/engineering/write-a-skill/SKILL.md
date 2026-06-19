---
name: write-a-skill
description: Create a new agent skill with correct structure, a sharp trigger description, and progressive disclosure. Use when the user wants to write, author, scaffold, or create a new skill — in this repo or any skills directory.
---

A skill is a folder containing a `SKILL.md` (YAML frontmatter + instructions) plus
optional supporting files. The whole craft is: **a tight, well-triggered `SKILL.md`
that delegates detail to supporting files loaded only when needed.**

## Before writing — interview the user

Do not start typing a skill from a one-line request. Resolve these first (ask only
what you can't infer):

1. **Trigger** — what is the user doing/saying when this skill should fire? This
   becomes the `description`. Be concrete: list the verbs and nouns ("review a PR",
   "the user mentions shoehorn").
2. **Procedure vs. knowledge** — is the skill a *process* to follow (steps, gates,
   loops) or a *body of knowledge* to apply (rules, references)? Most skills are
   procedures; write them as numbered steps.
3. **Rigidity** — must the steps be followed exactly (TDD, debugging), or are they
   adaptable guidance? Say which in the skill itself.
4. **Inputs/outputs** — what does it consume, what does it leave behind, where.

## Writing the SKILL.md

**Frontmatter** (only two fields):

```yaml
---
name: kebab-case-name        # matches the folder name; becomes the slash command
description: <one or two sentences. State WHAT it does, then "Use when …" with the
  concrete triggers. This is the ONLY thing the agent sees when deciding to invoke —
  make it match how the user actually phrases the request.>
---
```

The `description` is load-bearing: it is the entire basis on which the skill fires.
Pack it with real trigger phrases, not abstract summaries. Test it against the
red-flag phrasings in `description-craft.md`.

**Body** — keep `SKILL.md` short. Put the steps the agent always needs inline. Push
anything long, optional, or reference-like into a **supporting file** and point at it:

- `procedure.md` / named step files for deep workflows
- reference material (formats, rules, examples) as separate `*.md`
- runnable helpers under `scripts/`

See `progressive-disclosure.md` for when to split a file out versus keep it inline.

## After writing — wire it into the repo

If the skill lives in this repo, obey the **ship-list invariant** in `../../../CLAUDE.md`:

- **Shipped bucket** (`engineering/`, `personal/`, `learning/`) → add the skill to
  **both** its bucket `README.md` and the `skills` array in
  `.claude-plugin/plugin.json`, **and** the top-level `README.md`.
- **Parked bucket** (`in-progress/`, `deprecated/`) → add it to **neither**. New
  unproven skills usually start in `in-progress/`.

Then verify: run `scripts/list-skills.sh` to confirm the skill is discovered, and
`scripts/link-skills.sh` to use it locally.

## Reference

- `description-craft.md` — how to write a description that triggers reliably
- `progressive-disclosure.md` — what to inline vs. split into supporting files
