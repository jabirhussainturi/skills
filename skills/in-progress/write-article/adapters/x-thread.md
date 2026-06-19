# Adapter — X / Twitter thread

**Output:** `thread.txt` · **Format:** numbered tweets · **Diagrams:** attached PNGs

A thread is not the article chopped into 280-char pieces — it's a re-telling optimized
for momentum. Derive `thread.txt` from the canonical:

- **Tweet 1 is the hook.** A claim, a result, or a tension that makes scrolling stop.
  No "🧵 A thread on…". Earn the unroll in the first line.
- Each subsequent tweet carries **one** idea and ends with a reason to read the next.
- **≤ 280 characters per tweet.** Number them `1/`, `2/`, … Put the count only if known
  (`1/9`), else just `1/`.
- Format the file as tweets separated by a blank line and a `---` divider so it's
  copy-pasteable one at a time:

  ```
  1/ <hook tweet>

  ---

  2/ <next>
  ```

- Mark where to attach a diagram PNG: `[attach: diagrams/architecture.png]` on its own
  line under the relevant tweet.
- Last tweet: the payoff + a link to the full article (`<FULL_ARTICLE_URL>`) + a soft
  CTA (follow / reply).
- Aim for 6–12 tweets. Longer threads lose people.

**Publish instruction (report line):** "X: post `thread.txt` tweet by tweet; attach the
marked PNGs; replace `<FULL_ARTICLE_URL>` in the last tweet."
