#!/usr/bin/env bash
set -euo pipefail

# Lists every skill in the repo (path to each SKILL.md), grouped by bucket order.

REPO="$(cd "$(dirname "$0")/.." && pwd)"

cd "$REPO"
find skills -name SKILL.md -not -path '*/node_modules/*' | sort
