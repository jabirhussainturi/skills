# jabir-skills

**My agent skills — small, sharp tools I use across personal, engineering, and learning work.**

[![skills.sh](https://skills.sh/b/jabirhussainturi/skills)](https://skills.sh/jabirhussainturi/skills)

These are the skills I reach for every day, packaged so I can drop them onto any machine
or agent in one command. They're built to be **small, composable, and model-agnostic** —
each one does a single job well and gets out of the way. No framework, no lock-in. Take
one, fork it, make it yours.

Distributed as a single Claude Code plugin, but you can also cherry-pick individual
skills via [skills.sh](https://skills.sh).

## Install

**Everything (native Claude Code):**

```
/plugin marketplace add jabirhussainturi/skills
/plugin install jabir-skills@jabir-skills
```

**Everything (skills.sh — Claude Code, Codex, Cursor, …):**

```bash
npx skills@latest add jabirhussainturi/skills
```

**Just one skill** — pick exactly what you want, nothing else:

```bash
npx skills@latest add jabirhussainturi/skills --skill write-a-skill -y -g
```

`--skill <name>` installs only that skill (`-g` user-level, `-y` no prompts). Run with
`--list` to see what's available, or `--all` to grab the lot.

**Local development** — symlink every skill (drafts included) into `~/.claude/skills`:

```bash
./scripts/link-skills.sh
```

## The skills

### 🛠 Engineering

Tools for code and tooling work.

- **[write-a-skill](./skills/engineering/write-a-skill/SKILL.md)** — Author a new skill
  the right way. It interviews you for the *real* trigger, writes a `description` sharp
  enough to actually fire when you want it, splits long detail into supporting files
  (progressive disclosure), and wires the result into the repo's ship-list so
  `plugin.json` never silently drifts. The skill that makes every other skill easier.

### ✍️ Personal

Personal workflow and content tools.

_Nothing shipped yet — skills incubate in [`in-progress/`](./skills/in-progress/) until
they survive a real run, then graduate here._

### 📚 Learning

Skills that help me actually learn a thing — explain a codebase, quiz me, study a paper,
drill with spaced repetition.

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

The details: governance and conventions in [CLAUDE.md](./CLAUDE.md), the repo's domain
language in [CONTEXT.md](./CONTEXT.md), and architecture decisions in
[docs/adr/](./docs/adr/).

## License

[MIT](./LICENSE) © 2026 Jabir Hussain — take them, fork them, make them yours.
