# ADR format

ADRs live in `docs/adr/` with sequential numbering: `0001-slug.md`, `0002-slug.md`, …
Scan the directory for the highest number and increment. Create `docs/adr/` lazily — only
when the first ADR is needed.

## Template

```md
# {Short title of the decision}

{1–3 sentences: the context, what was decided, and why.}
```

That's it. An ADR can be a single paragraph. The value is recording *that* a decision was
made and *why* — not filling out sections.

## Optional sections

Include only when they add genuine value (most ADRs won't need them):

- **Status** (`proposed | accepted | deprecated | superseded by ADR-NNNN`) — when
  decisions get revisited.
- **Considered options** — when the rejected alternatives are worth remembering.
- **Consequences** — when non-obvious downstream effects need calling out.

## When to offer an ADR

All three must be true:

1. **Hard to reverse** — changing your mind later carries meaningful cost.
2. **Surprising without context** — a future reader will look at the code and wonder
   "why on earth did they do it this way?"
3. **The result of a real trade-off** — there were genuine alternatives and you picked one
   for specific reasons.

If a decision is easy to reverse, skip it. If it isn't surprising, nobody will wonder why.
If there was no real alternative, there's nothing to record.

### What qualifies

- **Architectural shape** — "monorepo"; "event-sourced write model, projected read model".
- **Integration patterns between contexts** — "Ordering and Billing talk via domain events,
  not synchronous HTTP".
- **Technology choices that carry lock-in** — database, message bus, auth provider, deploy
  target. Not every library — the ones that would take a quarter to swap.
- **Boundary and scope decisions** — "Customer data is owned by the Customer context;
  others reference it by ID only." The explicit no-s are as valuable as the yes-s.
- **Deliberate deviations from the obvious path** — "manual SQL instead of an ORM because
  X." Anything a reasonable reader would assume the opposite of.
- **Constraints not visible in the code** — "no AWS, for compliance"; "<200ms responses,
  per the partner contract".
- **Rejected alternatives when the rejection is non-obvious** — picked REST over GraphQL
  for subtle reasons? Record it, or someone re-suggests GraphQL in six months.

_Adapted from [mattpocock/skills](https://github.com/mattpocock/skills) (MIT)._
