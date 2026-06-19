# Adapter — Dev.to

**Output:** `devto.md` · **Format:** Markdown + front matter · **Diagrams:** native Mermaid

Dev.to (Forem) renders markdown AND Mermaid natively, so it's the highest-fidelity
target — no image conversion needed.

- Begin with Dev.to front matter:

  ```yaml
  ---
  title: <article title>
  published: false
  tags: <up to 4 comma-separated tags>
  description: <one-sentence summary for SEO/preview>
  ---
  ```

  Keep `published: false` — produce a draft, never auto-publish without review.
- Keep the full canonical body and all code blocks.
- Keep diagrams as ` ```mermaid ` source blocks (do **not** swap to images) — Dev.to
  renders them.
- Dev.to supports liquid embeds (`{% embed %}`) for tweets/gists if relevant; otherwise
  plain markdown.

**Optional real publish:** Dev.to has a public API. If the user supplies a
`DEV_TO_API_KEY`, the article can be created as a draft via
`POST https://dev.to/api/articles`. Default is to leave the file for manual paste.

**Publish instruction (report line):** "Dev.to: paste `devto.md` (front matter
included), or push as a draft with your API key. Mermaid renders as-is."
