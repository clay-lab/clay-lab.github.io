#!/usr/bin/env bash

set -euo pipefail

if [[ "${1:-}" == "" ]]; then
  echo "Usage: scripts/publish-live.sh \"commit message\""
  exit 1
fi

COMMIT_MSG="$1"
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

cd "$ROOT_DIR"

BRANCH="$(git branch --show-current)"
if [[ "$BRANCH" == "master" ]]; then
  echo "Refusing to run on master. Create/switch to a feature branch first."
  exit 1
fi

"$ROOT_DIR/scripts/prepare-live.sh"

git add -A

if git diff --cached --quiet; then
  echo "No changes to commit."
else
  git commit -m "$COMMIT_MSG"
fi

git push -u origin "$BRANCH"

PR_URL="https://github.com/clay-lab/clay-lab.github.io/compare/master...$BRANCH?quick_pull=1"
echo "Open PR: $PR_URL"

if command -v open >/dev/null 2>&1; then
  open "$PR_URL"
fi
