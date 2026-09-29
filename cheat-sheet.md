## CLAY Lab Website — Publish Workflow Cheat Sheet

**Repo root:** `/Users/robert.frank/Sites/clay-lab.github.io`
**Edit data in:** `astro-site/src/data/*.yml` (e.g. `papers.yml`, `members.yml`)

### 1. Start clean, from `master`
```bash
cd /Users/robert.frank/Sites/clay-lab.github.io
git checkout master
git pull
git checkout -b your-branch-name
```
> Only add `git stash` before this if you already have uncommitted edits sitting on an old branch.

### 2. Make your edits
Edit the relevant file(s) in `astro-site/src/data/`.

### 3. Format
```bash
cd astro-site
npx prettier --write src/data/<file>.yml
cd ..
```

### 4. Check + preview locally
```bash
scripts/check-prod-local.sh
```
- Runs `astro check`, ESLint, Prettier check, then a production build, then starts a local preview server.
- Open **http://localhost:4322** and verify your change.
- ⚠️ If the page doesn't look right, check `lsof -i :4322` first — a stale server from another branch/worktree can silently hijack the port.
- Press `Ctrl+C` to stop the preview when done.

### 5. Publish
```bash
scripts/publish-live.sh "Short description of your change"
```
This builds, copies `dist/` into the repo root, commits, and pushes your branch. It prints a PR link at the end.

### 6. Open the PR link and merge it
GitHub Pages only serves from `master` — **nothing is live until the PR is merged.**

### 7. Verify live
Give it a minute, then check https://clay-lab.github.io (hard refresh if needed).

### 8. Clean up
```bash
git checkout master
git pull
git branch -d your-branch-name
```

---

**Quick sanity checks if something seems off:**
- `git branch --show-current` — confirm you're not still on an old/merged branch
- `git status --short` — confirm what's actually changed
- `lsof -i :4321 -i :4322` — confirm no stale preview server is masking your changes

I noticed your `fix-open-mind-pdf-link` branch was already merged via PR #34 — nice work, that one's fully published. Want me to run step 8 (clean up the local branch) now?