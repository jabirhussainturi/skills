# Adapter — Personal blog (MDX)

**Output:** `blog.mdx` · **Format:** MDX + front matter · **Diagrams:** SVG or Mermaid

MDX is markdown plus JSX components. The exact front matter and components depend on
the user's blog. **Ask once** for their blog's conventions (or read an existing post
from their blog repo if a path is given) and remember them. Sensible default:

- Front matter:

  ```yaml
  ---
  title: <title>
  description: <one-sentence summary>
  date: <YYYY-MM-DD>
  tags: [<tag>, <tag>]
  draft: true
  ---
  ```

- Body is the full canonical in markdown — MDX is a superset, so standard markdown
  works as-is.
- Diagrams: reference the rendered SVG (`<img src="/images/<slug>/architecture.svg" />`
  or a markdown image), OR, if the blog has a `<Mermaid>` component, embed the source.
  Default to the SVG reference and note where to copy the file
  (`diagrams/architecture.svg` → the blog's public image dir).
- Keep `draft: true`; the user flips it when ready.

**Optional real publish:** if the blog is a git repo the user pointed at, "publish" can
mean writing `blog.mdx` into the repo's posts dir and the SVGs into its images dir, then
letting the user commit. Default is to leave the file in `<slug>/`.

**Publish instruction (report line):** "Blog: copy `blog.mdx` into your posts dir and
the diagram SVGs into your images dir; adjust front matter; flip `draft: false`."
