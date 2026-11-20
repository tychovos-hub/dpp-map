#!/bin/bash
# SessionStart hook. Cloud sessions only: runs npm ci when package-lock.json,
# package.json, .npmrc or this script changed since the last successful install.
if [ "$CLAUDE_CODE_REMOTE" != "true" ]; then
  exit 0
fi

cd "$CLAUDE_PROJECT_DIR" || exit 1
hash_file=node_modules/.session-start.sha256

if sha256sum --check --status "$hash_file" 2>/dev/null; then
  exit 0
fi

# npm ci removes node_modules (and the old hash file) first, so a failed
# install leaves no hash and the next session retries.
if npm ci; then
  sha256sum scripts/session-start.sh package.json package-lock.json .npmrc > "$hash_file" || rm -f "$hash_file"
else
  echo "session-start: npm ci failed; it will retry next session" >&2
fi
exit 0
