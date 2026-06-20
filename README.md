# jabir-skills

**The sharp, single-purpose agent skills I actually use — for building, writing, and learning. Not a framework. Tools.**

[![skills.sh](https://skills.sh/b/jabirhussainturi/skills)](https://skills.sh/jabirhussainturi/skills)

Most agent tooling wants to own your whole workflow — the big process frameworks like
GSD, BMAD, and Spec-Kit take the wheel and make it hard to climb back out when something
goes wrong. These skills are the opposite. Each one does **one** job, stays out of your
way, and works with whatever agent you're driving. Small enough to read in a minute,
composable enough to chain, and yours to fork the second one doesn't fit.

The repo is also how I keep them honest: a skill earns its place or it stays parked.
What ships is what I trust.

> "Write programs that do one thing and do it well." — Doug McIlroy, the Unix philosophy

## Quickstart

**Everything (native Claude Code):**

```
/plugin marketplace add jabirhussainturi/skills
/plugin install jabir-skills@jabir-skills
```

**Everything (skills.sh — Claude Code, Codex, Cursor, …):**

```bash
npx skills@latest add jabirhussainturi/skills
```

**Just one skill** — cherry-pick exactly what you want, nothing else:

```bash
npx skills@latest add jabirhussainturi/skills --skill write-a-skill -y -g
```

`--skill <name>` installs only that skill (`-g` user-level, `-y` no prompts). Add
`--list` to see what's available, or `--all` to grab everything.

**Local development** — symlink every skill (drafts included) into `~/.claude/skills`:

```bash
./scripts/link-skills.sh
```

## Why these skills exist

I built these to fix the specific ways working with coding agents goes wrong. Each one
started as a recurring annoyance that was cheaper to solve once, properly, than to keep
working around.

### A skill is only as good as its trigger

**The problem.** You write a skill, and the agent never fires it — or fires it at the
wrong moment. Nine times out of ten the culprit is the `description`: too vague, or
written in *your* words instead of the words you'll actually type at the prompt. A
brilliant skill with a weak trigger is dead weight sitting in your context window.

> "There are only two hard things in Computer Science: cache invalidation and naming
> things." — Phil Karlton

**The fix.** [`write-a-skill`](./skills/engineering/write-a-skill/SKILL.md) treats the
description as the main event. It interviews you for the *real* trigger before writing a
line, drafts a description sharp enough to actually fire, and pushes the long detail into
supporting files so `SKILL.md` stays lean — progressive disclosure, so the agent only
loads what it needs. Then it wires the new skill into the repo's ship-list so nothing
drifts out of sync.

### A skills collection rots without a quality gate

**The problem.** Personal tool collections turn into junk drawers. Half-finished drafts
sit next to battle-tested tools, retired experiments linger, and after a while you stop
trusting what's even installed.

**The fix.** Buckets plus a ship-list invariant. Drafts live in `in-progress/` — usable
locally, never installed for anyone else. Retired skills go to `deprecated/`. A skill
only reaches a *shipped* bucket, and the install list, once it's proven. And the rule is
enforced, not vibes: every shipped skill appears in **both** its bucket README **and**
`plugin.json`; parked skills appear in **neither**. So "installed" always means "I trust
this one."

### Building and learning should leave a trail

**The problem.** You build something clever, or finally understand a gnarly topic — and
it evaporates. Or you write it up once, for a single platform, and it dies there.

**The fix.** That's what the `personal/` and `learning/` buckets are for: tools that turn
what I build and what I learn into something shareable and durable. They're filling in
now — the first few are incubating in `in-progress/` and will graduate here the moment
they survive real use.

## The skills

### 🛠 Engineering — code & tooling

- **[write-a-skill](./skills/engineering/write-a-skill/SKILL.md)** — Author a new skill
  the right way. It interviews you for the *real* trigger, writes a `description` sharp
  enough to actually fire, splits long detail into supporting files (progressive
  disclosure), and wires the result into the ship-list so `plugin.json` never silently
  drifts.
  - **Reach for it** every time you start a new skill, or when an existing skill won't
    trigger when you expect it to.
  - **Why it's here** the description is the entire basis on which a skill fires; get it
    wrong and the best skill in the world never runs. This is the skill that makes every
    other skill better.

### ✍️ Personal — workflow & content

Tools for turning work into writing, and for the day-to-day that isn't code.

_Nothing shipped yet — skills incubate in [`in-progress/`](./skills/in-progress/) until
they survive a real run, then graduate here._

### 📚 Learning — explain, quiz, study

Tools that help me actually learn a thing — explain a codebase, quiz me on it, study a
paper, drill with spaced repetition.

_Nothing shipped yet._

## How this repo is organized

Skills live in **buckets**. A bucket is either *shipped* (installs with the plugin) or
*parked* (lives in the repo, never installs):

| Bucket | State | What's in it |
|---|---|---|
| `engineering/` | **shipped** | daily code & tooling skills |
| `personal/` | **shipped** | personal workflow & content skills |
| `learning/` | **shipped** | skills that help me learn |
| `in-progress/` | parked | drafts — usable locally, not installed for others |
| `deprecated/` | parked | retired skills, kept for reference |

The rule that keeps `plugin.json` honest: every shipped skill appears in **both** its
bucket README **and** the plugin's ship-list; parked skills appear in **neither**. A
skill graduates from `in-progress/` to a shipped bucket once it's proven.

The details live where you'd expect: governance and conventions in
[CLAUDE.md](./CLAUDE.md), the repo's domain language in [CONTEXT.md](./CONTEXT.md), and
architecture decisions in [docs/adr/](./docs/adr/).

## License

[MIT](./LICENSE) © 2026 Jabir Hussain — take them, fork them, make them yours.
