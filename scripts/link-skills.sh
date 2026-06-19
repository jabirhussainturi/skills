#!/usr/bin/env bash
set -euo pipefail

# Links every skill in this repo into ~/.claude/skills so the local Claude CLI
# can use them. Skips deprecated/ (retired skills should not be linked).
# in-progress/ IS linked, so drafts are usable locally before they ship.

REPO="$(cd "$(dirname "$0")/.." && pwd)"
DEST="$HOME/.claude/skills"

# If ~/.claude/skills is itself a symlink into this repo, we'd write the per-skill
# symlinks back into our own tree. Detect and bail instead of polluting the repo.
if [ -L "$DEST" ]; then
  resolved="$(readlink -f "$DEST" 2>/dev/null || readlink "$DEST")"
  case "$resolved" in
    "$REPO" | "$REPO"/*)
      echo "error: $DEST is a symlink into this repo ($resolved)." >&2
      echo "Remove it (rm \"$DEST\") and re-run; the script recreates it as a real dir." >&2
      exit 1
      ;;
  esac
fi

mkdir -p "$DEST"

find "$REPO/skills" -name SKILL.md \
  -not -path '*/node_modules/*' \
  -not -path '*/deprecated/*' \
  -print0 |
while IFS= read -r -d '' skill_md; do
  src="$(dirname "$skill_md")"
  name="$(basename "$src")"
  target="$DEST/$name"

  if [ -e "$target" ] && [ ! -L "$target" ]; then
    rm -rf "$target"
  fi

  ln -sfn "$src" "$target"
  echo "linked $name -> $src"
done
