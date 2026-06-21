---
name: grill-with-docs
description: Grilling session that stress-tests your plan against the codebase's domain model — challenging terminology against CONTEXT.md, cross-referencing claims against the real code, and recording hard decisions as ADRs, inline as decisions crystallise. Use when stress-testing a plan or design while working in an existing codebase. For non-code planning, use grill-me.
---

<what-to-do>

Interview the user relentlessly about every aspect of their plan until you reach a shared
understanding. Walk down each branch of the design tree, resolving dependencies one at a
time, and for each question recommend an answer. Ask one question at a time and wait for
the answer.

If a question can be answered by exploring the codebase, explore the codebase instead.

This is `grill-me` with domain awareness bolted on: as decisions crystallise, sharpen the
project's language in `CONTEXT.md` and record hard, surprising, traded-off decisions as
ADRs — inline, as they happen, not batched at the end.

</what-to-do>

<supporting-info>

## Find the existing docs first

Before grilling, locate the project's domain docs so you can challenge against them:

- A root **`CONTEXT.md`** — the glossary for a single-context repo (this repo has one).
- A **`CONTEXT-MAP.md`** at the root — means multiple bounded contexts, each with its own
  `CONTEXT.md` (e.g. `src/ordering/CONTEXT.md`). Read the map to find them; infer which
  context the current topic belongs to, and ask if it's unclear.
- **`docs/adr/`** — the decision records.

Create files lazily — only when you have something to write. No `CONTEXT.md`? Create one
when the first term is resolved. No `docs/adr/`? Create it when the first ADR is needed.

## During the session

- **Challenge against the glossary.** When a term conflicts with `CONTEXT.md`, call it out
  immediately: "Your glossary defines 'cancellation' as X, but you mean Y — which is it?"
- **Sharpen fuzzy language.** Replace vague or overloaded words with a precise canonical
  term: "You say 'account' — Customer or User? Those are different things."
- **Stress-test with concrete scenarios.** Invent edge-case scenarios that force the user
  to be precise about the boundaries between concepts.
- **Cross-reference with code.** When the user states how something works, check that the
  code agrees. Surface contradictions: "Your code cancels whole Orders, but you just said
  partial cancellation works — which is right?"
- **Update `CONTEXT.md` inline.** Capture each resolved term right away; don't batch.
  Use the format in [CONTEXT-FORMAT.md](./CONTEXT-FORMAT.md). Keep it domain-meaningful —
  never couple it to implementation detail.
- **Offer ADRs sparingly.** Only when all three are true: hard to reverse, surprising
  without context, and the result of a real trade-off. Use the format in
  [ADR-FORMAT.md](./ADR-FORMAT.md). If any of the three is missing, skip it.

</supporting-info>

_Adapted from [mattpocock/skills](https://github.com/mattpocock/skills) (MIT)._
