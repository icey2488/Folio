#!/usr/bin/env bash
set -euo pipefail
SHA="${CF_PAGES_COMMIT_SHA:-}"
SHORT="${SHA:0:7}"; [ -z "$SHORT" ] && SHORT="local"
# Stamp the live commit into every served index.html. Runs on Cloudflare's
# ephemeral build only; repo files keep the __COMMIT__ placeholder.
grep -rl --include=index.html "__COMMIT__" . | while read -r f; do
  sed -i "s/__COMMIT__/$SHORT/g" "$f"
done
echo "Folio build stamped: $SHORT"
