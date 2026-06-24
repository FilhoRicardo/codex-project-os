# Create — scaffolding details

Loaded on demand by `project-new`.

## Steps

1. Confirm `active/<slug>/` does not already exist (if it does, use `repair.md`).
2. Copy the template:
   - `managed` → `AGENTS.md`, `CLAUDE.md`, `PLAN.md`, `PLAN-REVIEW-LOG.md`, `MEMORY.md`, `.gitignore`, `resources/`.
   - `basic` → `AGENTS.md`, `MEMORY.md`, `resources/`.
3. Replace placeholders in each file: project name, slug, one-line routing trigger, source-of-truth links (GitHub, Linear), and the verification command.
4. Initialize `MEMORY.md` with project headings only — Source Links, Key Decisions, Durable Outcomes. Do **not** copy root memory in.
5. Keep `PLAN.md` + `PLAN-REVIEW-LOG.md` for managed projects even before the first review.

## Placeholder conventions

Templates use `<PLACEHOLDER>` tokens. Replace every one before finishing:

- `<PROJECT_NAME>` / `<SLUG>` — human name and folder slug.
- `<OUTCOME>` — one sentence on what success looks like.
- `<GITHUB_URL>` / `<LINEAR_URL>` — fill, or write `Create/link required` with the blocker.
- `<VERIFY_CMD>` — the command that proves the project builds/tests.

## Branding (optional)

If the project has UI and the user has a house brand, point `AGENTS.md` at it in one line (e.g. "read `<brand>/BRAND.md` before UI work"). Do not haul brand assets into this scaffold — keep them in the user's own resources. If no brand exists, skip.

## Notes

- If GitHub/Linear tools are unavailable, write `Create/link required` and name the blocker. Never invent URLs.
- Every changed line should trace to the user's request — don't "improve" template content beyond placeholder substitution.
