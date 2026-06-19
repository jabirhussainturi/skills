# Seeding and maintaining `voice.md`

`voice.md` is the persistent profile that makes drafts sound like the user. It lives at
the **workspace root** (above `articles/`), is read on **every** run, and is corrected
over time. It is NOT per-article.

## Seeding when the user HAS sample articles

Ask for 1–3 of their existing posts (paths or URLs). Read them and extract, into the
template below:

- Sentence rhythm (short and punchy? long and winding? mixed?).
- How they open (anecdote? claim? question?).
- Recurring moves and tics (asides in parentheses? em-dashes? rhetorical questions?).
- Vocabulary they reach for, and words they'd never use.
- Formality, humor, use of "I" / "you", profanity tolerance.
- How they handle code and examples.

Quote 2–3 real sentences from their writing as anchors.

## Seeding when the user has NO samples (calibration)

Ask these five, then fill the template from the answers:

1. Name two writers or blogs whose style you'd be happy to be compared to.
2. Do you write more like you talk, or more formally?
3. First person ("I built…") or impersonal ("the system…")?
4. Any words or phrases you hate seeing in your writing?
5. Humor and asides — yes, sparingly, or never?

## Template

```markdown
# Voice profile — <name>

## In one line
<e.g. "Dry, concrete, first-person; short sentences; hates buzzwords.">

## Sentence & rhythm
- <e.g. "Short declaratives. Occasional long sentence for a complex idea, then a short one to land it.">

## Openings
- <e.g. "Open on a specific failure or a number. Never with a definition.">

## Signature moves
- <e.g. "Parenthetical asides. Em-dashes for interruptions. One rhetorical question max per piece.">

## Person & tone
- Person: <I / you / impersonal>
- Tone: <dry / warm / blunt / playful>
- Humor: <none / sparing / frequent>

## Vocabulary
- Reaches for: <words>
- Never uses: <words>  (in addition to ANTI-SLOP.md's banned list)

## Code & examples
- <e.g. "Always a runnable snippet over pseudocode. Comments sparse.">

## Anchor sentences (real examples of the voice)
1. "<quote>"
2. "<quote>"
```

## Maintaining it

At the canonical-review gate (SKILL.md step 3), when the user corrects the voice,
write the correction back here as a new bullet. The profile should get sharper with
every article.
