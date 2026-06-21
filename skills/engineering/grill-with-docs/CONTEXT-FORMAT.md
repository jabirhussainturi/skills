# CONTEXT.md format

## Structure

```md
# {Context name}

{One or two sentences: what this context is and why it exists.}

## Language

**Order**:
A concise description of the term.
_Avoid_: purchase, transaction

**Invoice**:
A request for payment sent to a customer after delivery.
_Avoid_: bill, payment request

**Customer**:
A person or organization that places orders.
_Avoid_: client, buyer, account

## Relationships

- An **Order** produces one or more **Invoices**
- An **Invoice** belongs to exactly one **Customer**

## Example dialogue

> **Dev:** "When a **Customer** places an **Order**, do we create the **Invoice** immediately?"
> **Domain expert:** "No — an **Invoice** is only generated once a **Fulfillment** is confirmed."

## Flagged ambiguities

- "account" was used to mean both **Customer** and **User** — resolved: these are distinct.
```

## Rules

- **Be opinionated.** When multiple words exist for one concept, pick the best and list the
  rest as aliases to avoid.
- **Flag conflicts explicitly.** Ambiguous term? Call it out under "Flagged ambiguities"
  with a clear resolution.
- **Keep definitions tight.** One sentence. Define what it IS, not what it does.
- **Show relationships.** Bold term names; express cardinality where it's obvious.
- **Only include terms specific to this project's context.** General programming concepts
  (timeouts, error types, utility patterns) don't belong, even if used heavily. Ask: is
  this unique to this context, or general programming? Only the former belongs.
- **Group terms under subheadings** when natural clusters emerge; a flat list is fine if
  they all belong to one cohesive area.
- **Write an example dialogue** between a dev and a domain expert that shows the terms
  interacting and clarifies boundaries between related concepts.

## Single vs multi-context repos

**Single context (most repos):** one `CONTEXT.md` at the repo root.

**Multiple contexts:** a `CONTEXT-MAP.md` at the root lists the contexts, where they live,
and how they relate:

```md
# Context map

## Contexts

- [Ordering](./src/ordering/CONTEXT.md) — receives and tracks customer orders
- [Billing](./src/billing/CONTEXT.md) — generates invoices and processes payments

## Relationships

- **Ordering → Billing**: Ordering emits `OrderPlaced`; Billing consumes it to invoice
```

Infer which structure applies: `CONTEXT-MAP.md` present → multiple contexts (read it);
only a root `CONTEXT.md` → single context; neither → create a root `CONTEXT.md` lazily
when the first term is resolved.

_Adapted from [mattpocock/skills](https://github.com/mattpocock/skills) (MIT)._
