Legacy site backup created before promoting Astro to production root.

Backup timestamp: 2026-08-13
Backup folder: legacy-site-backup/2026-08-13-pre-astro-cutover

This folder contains the previous Jekyll-based production site files.

Restore steps:
1) Remove current Astro root web files (index.html, members/, publications/, research/, assets/, etc.).
2) Move all files from this backup folder back to repository root.
3) Remove .nojekyll if you want GitHub Pages to process Jekyll again.
4) Commit and push the restore commit.
