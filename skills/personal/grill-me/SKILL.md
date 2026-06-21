---
name: grill-me
description: Get relentlessly interviewed about a plan or design until every branch of the decision tree is resolved, one question at a time, with a recommended answer for each. Use when the user wants to stress-test a plan before building, pressure-test a design, get grilled, or says "grill me". For non-code planning — when working inside an existing codebase, use grill-with-docs instead.
---

Interview the user relentlessly about every aspect of their plan until you reach a
shared understanding. Walk down each branch of the design tree, resolving dependencies
between decisions one at a time.

The rules that make it work:

- **One question at a time.** Wait for the answer before asking the next. A wall of
  questions is bewildering and yields shallow answers.
- **Always recommend an answer.** For every question, give your recommended option and a
  one-line reason. Don't sit on the fence — the user can override you, but they need your
  read.
- **Resolve dependencies in order.** Settle the decision that other decisions hang off
  *before* the ones that depend on it. Name the dependency out loud when it matters.
- **Explore instead of asking.** If a question can be answered by reading the files, the
  repo, or a link the user gave you, go find the answer rather than asking.
- **Keep going until the tree is resolved.** Stop only when every branch that affects the
  build has an answer — then synthesise the decisions into a short blueprint and confirm
  it before any work begins.

This is for general, non-code planning — writing, product, a design in the abstract. When
you're grilling a change to an **existing codebase**, use `grill-with-docs` instead: it
adds the same loop plus domain-language (`CONTEXT.md`) and decision-record (ADR)
awareness.

_Adapted from [mattpocock/skills](https://github.com/mattpocock/skills) (MIT)._
