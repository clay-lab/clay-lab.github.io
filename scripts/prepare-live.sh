#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ASTRO_DIR="$ROOT_DIR/astro-site"

echo "==> Running checks"
npm --prefix "$ASTRO_DIR" run check

echo "==> Building Astro for production"
npm --prefix "$ASTRO_DIR" run build

echo "==> Refreshing root deployment files"
for path in \
  404.html \
  _headers \
  assets \
  decapcms \
  hillhouse-37.webp \
  images \
  index.html \
  members \
  papers \
  photos \
  publications \
  research \
  robots.txt \
  sitemap-0.xml \
  sitemap-index.xml \
  test.jpg; do
  rm -rf "$ROOT_DIR/$path"
done

cp -R "$ASTRO_DIR/dist/." "$ROOT_DIR/"
touch "$ROOT_DIR/.nojekyll"

echo "==> Live files are ready in repo root"
