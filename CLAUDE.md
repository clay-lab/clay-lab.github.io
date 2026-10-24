# CLAY Lab Website

Source lives in `astro-site/` (Astro/AstroWind). The repo root holds the built site that GitHub Pages serves from `master`, so don't edit root HTML/assets by hand. See `cheat-sheet.md` for the full publish workflow and `astro-site/AGENTS.md` for generic template docs.

## Common edits

- **Papers:** `astro-site/src/data/papers.yml`, newest first. Each entry has `title`, `authors`, `conference`, `pdf`, `image`. Always include `conference`; with no publication info, use just the year (e.g. `'2026'`). `pdf` can be a URL (DOI, arXiv, lingbuzz) or a local path under `/papers/`.
- **Images:** `astro-site/public/images/`, referenced as `/images/<name>.png`. Use a descriptive filename, not the source filename.
- **Members:** `astro-site/src/data/members.yml`, in three groups: `faculty`, `graduate`, `undergraduate`. Each entry has `name`, `photo` (`/photos/<name>_profile.jpg`, or `/photos/test.jpg` as a placeholder), `email`, optional `url` (personal site, department profile, or LinkedIn), and `title`. Faculty/graduate titles are like `PhD student <br> Linguistics`; undergraduate titles are just the class year as a string (e.g. `'2028'`). Photos go in `astro-site/public/photos/`.
- After editing a data file, run `npx prettier --write` on it from `astro-site/`.

## Workflow

1. Start each change on a fresh branch off `master` (`git checkout master && git pull && git checkout -b <name>`).
2. Preview with `scripts/check-prod-local.sh` (serves http://localhost:4322; stop it afterward with `astro preview stop` from `astro-site/`).
3. Publish with `scripts/publish-live.sh "message"`. It builds, commits the built output, and pushes the branch. Claude Code's auto mode blocks this as a production deploy, so the user runs it themselves with `! scripts/publish-live.sh "message"`.
4. The user opens and merges the PR; nothing is live until it merges. Afterward, delete the local branch.
