#!/bin/bash
# Merge new course content from upstream into main at session start.
cd "$(dirname "$0")/../.." || exit 0
msg() { printf '{"systemMessage": "%s"}\n' "$1"; exit 0; }
[ "$(git branch --show-current)" = main ] || msg "Upstream sync skipped: not on main."
git fetch -q upstream main 2>/dev/null || msg "Upstream sync skipped: fetch failed (offline?)."
behind=$(git rev-list --count HEAD..upstream/main)
[ "$behind" -eq 0 ] && exit 0
if git merge -q --no-edit upstream/main >/dev/null 2>&1; then
  msg "Pulled $behind new upstream commit(s) into main."
else
  git merge --abort 2>/dev/null
  msg "Upstream merge hit a conflict and was aborted; ask Claude to resolve it."
fi
