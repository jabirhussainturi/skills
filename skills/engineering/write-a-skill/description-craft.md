# Writing a description that triggers reliably

The `description` is the only text the agent reads when deciding whether to invoke a
skill. Get it wrong and a perfect skill never fires. Get it right and it fires exactly
when it should.

## Shape

```
<What it does, one clause>. Use when <concrete triggers: verbs, nouns, phrasings the
user actually uses>.
```

- **Lead with the capability**, then the triggers. The agent matches on both.
- **Use the user's words, not yours.** If users say "QA", "report a bug", "file an
  issue" — put those exact phrases in. Don't paraphrase them into "defect intake".
- **Name the artifacts and tools** the skill touches ("shoehorn", "Husky",
  "GitHub issues", ".docx") — these are strong, unambiguous triggers.
- **Bound it.** If the skill is *not* for something nearby, the body can say so; but
  keep the description focused so it doesn't over-trigger.

## Good vs. weak

- Weak: `description: Helps with writing.` → fires on everything or nothing.
- Good: `description: Edit and improve article drafts by restructuring sections and
  tightening prose. Use when the user wants to edit, revise, or improve an article.`

## Test it

Before finalizing, write down 3 phrasings a user might use to ask for this, and 2
nearby phrasings that should *not* trigger it. Read the description and check it
clearly separates them. If a should-not case looks like a match, tighten the wording.
