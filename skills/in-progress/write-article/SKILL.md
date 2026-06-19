---
name: write-article
description: Turn source material into a publish-ready, multi-platform article set — Medium, LinkedIn, Dev.to, an X/Twitter thread, and a blog MDX file — with Mermaid diagrams, written in the user's own voice. Use when the user wants to write, draft, or publish an article, blog post, or technical write-up for Medium / LinkedIn / Dev.to / a personal blog, especially with architecture or flow diagrams.
---

This skill **automates the production** of an article — structuring, drafting in your
voice, drawing diagrams, and formatting for every platform — while the **substance and
voice stay yours**. It does not invent content from a bare topic; it transforms source
material you provide.

It produces ONE canonical article, then derives each platform's version from it
(canonical-then-adapt). You review the *thinking* at three cheap gates; the skill
automates all the *formatting*.

## 0. Resolve inputs

- **Primary input — source material.** Ask for (or accept) a path to a markdown file
  of notes / a transcript / a rough draft. This is the substance. If none is given but
  the current conversation contains the material (e.g. you just designed or built
  something), offer to use the conversation as the source.
- **Booster — codebase.** If the article is about a system, ask for a repo/path. Read
  it so diagrams are grounded in **real** code, not invented.
- **Voice profile.** Look for `voice.md` at the workspace root.
  - If present, read it — it governs how the draft sounds.
  - If absent, **seed it** (see `voice-template.md`): either from 1–3 of the user's
    existing articles (extract their patterns) or via a 5-question calibration. Save it
    at the workspace root so it persists and improves across articles.
- **Output root.** Default `./articles/`. Ask once if unsure, then remember it. Create
  `./articles/<slug>/` for this run (slug from the working title). Never write articles
  into a skills repo — this is the user's content.

If invoked with `--auto`, skip the gates in steps 1–3 (run straight through) — use only
for low-stakes posts you trust.

## 1. GATE — Angle & outline

Propose the **thesis** (one sentence: what this article argues) and a **section
outline** (ordered; respect information dependencies — later sections may rely on
earlier ones). For each section, note what the reader needs from it. Show it; get the
user's approval or edits **before drafting**. Fixing the angle here is cheap; fixing it
after five platform files exist is not.

## 2. Draft the canonical article

Write `<slug>/canonical.md` — the full master article in markdown. While drafting:

- **Apply the voice profile** (`voice.md`) and the **anti-slop pass** (`ANTI-SLOP.md`).
  Both, every time. `voice.md` makes it sound like *you*; `ANTI-SLOP.md` makes it not
  sound like a *bot*.
- **Place diagrams** where the argument needs a picture. Author each as Mermaid source
  in `<slug>/diagrams/<name>.mmd`, grounded in the source/codebase. See `DIAGRAMS.md`.
- Pull from the source material as a quarry — rework fragments to fit; never dump.

## 3. GATE — Canonical & voice review (then diagrams)

Show the canonical. This is the one place "human-like" is enforced — read it for voice
drift and substance. Capture any voice corrections back into `voice.md` so the next
article is better. Then **render the diagrams** (`DIAGRAMS.md` → `mmdc`) to SVG/PNG and
**GATE on diagram accuracy** — a wrong arrow grounded in real code is worse than no
diagram. Fix Mermaid source and re-render until correct.

## 4. Adapt to every platform (automatic)

With the canonical and diagrams approved, run each adapter to produce its file in
`<slug>/`. Adapters are deterministic reformatting — no gate. See `adapters/`:

| Output | Adapter |
|---|---|
| `medium.md` | `adapters/medium.md` |
| `linkedin.txt` | `adapters/linkedin.md` |
| `devto.md` | `adapters/devto.md` |
| `thread.txt` | `adapters/x-thread.md` |
| `blog.mdx` | `adapters/blog-mdx.md` |

To support a new platform later, add one file under `adapters/` and one row above —
no change to this workflow.

## 5. Report

Print the `<slug>/` path and, per platform, the one-line publish instruction from its
adapter (Medium/LinkedIn are paste-and-upload; Dev.to/blog can be more automated). List
which diagrams were embedded as images vs. kept as Mermaid source.

## Reference

- `ANTI-SLOP.md` — the built-in craft rules (always applied)
- `voice-template.md` — how to seed and maintain the persistent `voice.md`
- `DIAGRAMS.md` — Mermaid conventions, rendering, grounding in code
- `adapters/*.md` — one per platform
