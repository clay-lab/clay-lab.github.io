#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ASTRO_DIR="$ROOT_DIR/astro-site"
PORT="${PORT:-4322}"

echo "==> Running checks"
npm --prefix "$ASTRO_DIR" run check

echo "==> Building production bundle"
npm --prefix "$ASTRO_DIR" run build

echo "==> Starting production preview server"
echo "    URL: http://localhost:$PORT"
npm --prefix "$ASTRO_DIR" run preview -- --host --port "$PORT"
