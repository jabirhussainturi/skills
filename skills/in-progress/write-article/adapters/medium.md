# Adapter — Medium

**Output:** `medium.md` · **Format:** Markdown · **Diagrams:** embedded images

Medium renders standard markdown (headings, bold/italic, lists, blockquotes, code
blocks) but NOT Mermaid. Derive `medium.md` from the canonical:

- Keep the full length and the full argument — Medium readers tolerate long-form.
- Keep code blocks with language fences.
- Replace each Mermaid block with an image reference to the rendered PNG/SVG
  (`![architecture](diagrams/architecture.png)`); the user drags the image in on paste.
- First heading is the title (H1). Add a one-line italic subtitle/dek under it if the
  canonical has a natural one.
- Use `>` blockquotes for pull quotes.
- Add 3–5 Medium tags at the end as a comment: `<!-- tags: ... -->`.

**Publish instruction (report line):** "Medium: paste `medium.md` into a new story;
drag in the images from `diagrams/`; set the tags listed at the bottom."
