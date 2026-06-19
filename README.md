# jabir-skills

Jabir Hussain's personal collection of agent skills — for **personal**, **engineering**, and **learning** work. Small, composable, model-agnostic. Distributed as a single Claude Code plugin.

## Install

**Native Claude Code:**

```
/plugin marketplace add jabirhussainturi/skills
/plugin install jabir-skills@jabir-skills
```

**Via skills.sh (Claude Code, Codex, Cursor, …):**

```bash
npx skills@latest add jabirhussainturi/skills
```

**Local development** (symlink every skill into `~/.claude/skills`, including drafts):

```bash
./scripts/link-skills.sh
```

## Skills

### Engineering

Skills for code and tooling work.

- **[write-a-skill](./skills/engineering/write-a-skill/SKILL.md)** — Scaffold a new skill with correct structure, a sharp trigger description, and progressive disclosure. Keeps the repo's ship-list invariant in sync.

### Personal

Personal workflow and content tools.

_No shipped skills yet._

### Learning

Skills that help me learn — explain, quiz, study.

_No shipped skills yet._

## Repository layout

```
skills/
├── engineering/   shipped — code & tooling
├── personal/      shipped — personal workflow & content
├── learning/      shipped — learning aids
├── in-progress/   parked  — drafts, usable locally, not installed
└── deprecated/    parked  — retired, kept for reference
```

Governance and conventions live in [CLAUDE.md](./CLAUDE.md); the repo's domain
language in [CONTEXT.md](./CONTEXT.md); architecture decisions in
[docs/adr/](./docs/adr/).

## License

[MIT](./LICENSE) © 2026 Jabir Hussain
