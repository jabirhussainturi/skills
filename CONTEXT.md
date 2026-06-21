# jabir-skills

A collection of agent skills (slash commands and behaviors) loaded by Claude Code and
compatible agents — organized into buckets and distributed as a single plugin.

## Language

**Skill**:
A self-contained unit of agent capability — a folder with a `SKILL.md` (frontmatter +
instructions) and optional supporting files, invoked by its `name:` (e.g. `/grill-me`).
_Avoid_: command, plugin (a Skill is not *the* plugin — the plugin bundles many Skills)

**Bucket**:
A top-level folder under `skills/` that groups Skills. Always either **shipped** or
**parked**.
_Avoid_: category, folder

**Shipped / parked**:
A Skill is **shipped** if it installs with the plugin (it's in the **Ship-list** and a
README); **parked** if it lives in the repo but never installs. Determined solely by which
**Bucket** holds it — shipped (`engineering`, `personal`, `learning`) vs parked
(`in-progress`, `deprecated`).

**Ship-list**:
The `skills` array in `.claude-plugin/plugin.json` — the single source of truth for what
installs.
_Avoid_: skills array, manifest list (when precision matters)

**Promotion**:
Moving a Skill from a parked **Bucket** into a shipped one, adding it to the **Ship-list**
and the READMEs in the same change. The moment a draft becomes installable.

**Trigger description**:
The `description:` field in a Skill's frontmatter — the text the agent matches on to decide
whether to invoke the Skill. The single most load-bearing line in a `SKILL.md`.
_Avoid_: "the description" unqualified — it's overloaded (see Flagged ambiguities)

### Terms used by the `write-article` skill

**Canonical (article)**:
The single master article (markdown, with diagrams and full argument) that all platform
variants are derived from. Reviewed once; never published directly.

**Adapter**:
A per-platform spec that deterministically transforms the **Canonical** into one platform's
output file (Medium, LinkedIn, Dev.to, X thread, blog MDX). Adding a platform = adding an
Adapter.

**Voice profile**:
The persistent `voice.md` the user maintains, read on every run, that makes drafts sound
like the user — as opposed to the built-in anti-slop rules, which only make drafts *not*
sound like a bot.

## Relationships

- A **Bucket** holds many **Skills**; a **Skill** belongs to exactly one **Bucket**.
- The **Ship-list** references every **shipped** Skill and no **parked** Skill.
- **Promotion** moves a Skill from a parked **Bucket** to a shipped one *and* adds it to
  the **Ship-list** — never one without the other.
- A **Canonical** article produces many platform files, one per **Adapter**.

## Example dialogue

> **Me:** "Let's ship `write-article`."
> **Agent:** "It's in `in-progress/` — a *parked* Bucket, so it's deliberately not in the
> Ship-list. Shipping it is a **Promotion**: move it to `personal/`, then add it to
> `plugin.json` and both READMEs. Do that now?"

## Flagged ambiguities

- **"personal"** — here it's a *content* **Bucket** that **ships**. In
  [`mattpocock/skills`](https://github.com/mattpocock/skills) (the structural reference)
  "personal" means a *not-promoted* bucket. Resolved: in this repo, **personal** ships.
- **"category" vs "bucket"** — resolved: the grouping folder is a **Bucket**; "category"
  is avoided.
- **"description"** — overloaded across the **Trigger description** (`SKILL.md` frontmatter),
  the **plugin description** (`plugin.json` / `marketplace.json`), and **README prose**.
  Resolved: always say which one. (This one genuinely caused confusion — name it.)
