#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ASTRO_DIR="$ROOT_DIR/astro-site"

echo "==> Starting Astro dev server"
echo "    URL: http://localhost:4321"
npm --prefix "$ASTRO_DIR" run dev
