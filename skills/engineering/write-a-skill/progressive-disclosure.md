# Progressive disclosure

The agent loads `SKILL.md` whenever the skill triggers. Everything in it costs context
on *every* invocation. Supporting files are loaded only when the agent follows a
pointer to them. So:

> Put what's **always needed** in `SKILL.md`. Put what's **sometimes needed** in a
> supporting file and point at it.

## Keep inline

- The frontmatter.
- The core procedure — the steps the agent runs every time.
- Short, decisive rules.

## Split into a supporting file

- Long reference material (file formats, full rule lists, template text).
- Branch-specific detail ("if using GitHub… / if using GitLab…") — one file per branch.
- Examples and worked walkthroughs.
- Anything over ~30 lines that isn't run every time.

Point at split files explicitly from `SKILL.md`, e.g. "See `mocking.md` for the rules
on test doubles." Give each pointer a one-line reason so the agent knows when to open
it.

## Scripts

Deterministic, repeatable work (linking, scaffolding, validation) belongs in
`scripts/`, not in prose the agent re-derives each time. Reference the script by path
and let the agent run it.

## Rule of thumb

If `SKILL.md` scrolls past ~120 lines, something in it is reference material that wants
to be a supporting file.
