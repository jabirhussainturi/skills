# Adapter — LinkedIn

**Output:** `linkedin.txt` · **Format:** plain text · **Diagrams:** uploaded images

LinkedIn renders **no markdown**. No headings, no bold, no inline links styled, no
code formatting, no inline images. Plan accordingly:

- **Hook in the first 2 lines** — they're all that shows before "…see more". Make them
  earn the click. No "I wrote a new article about…".
- **Short paragraphs**, 1–3 sentences, separated by blank lines. Generous whitespace.
- Strip all markdown syntax. For emphasis use line breaks and the occasional
  Unicode bullet (•) or arrow (→), not `**`/`#`.
- Code: keep it minimal; LinkedIn mangles it. Prefer describing it, or a 2–3 line
  snippet as plain text. Long code → "full code in the article" + link.
- Target **~1,300–3,000 characters**. Compress the canonical to its sharpest spine;
  this is a teaser, not the full piece.
- End with a one-line CTA pointing to the full version (Medium/blog link placeholder
  `<FULL_ARTICLE_URL>`) and **3–5 hashtags**.
- Diagrams are uploaded as PNGs (note which `diagrams/*.png` to attach, in order).

**Publish instruction (report line):** "LinkedIn: paste `linkedin.txt`; upload the
listed PNGs as images; replace `<FULL_ARTICLE_URL>`."
