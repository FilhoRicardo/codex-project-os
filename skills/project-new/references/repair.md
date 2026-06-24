# Repair — fixing an existing project

Loaded on demand by `project-new` when `active/<slug>/` already exists.

## Steps

1. Inspect what's there: project folder, `git remote -v`, local instruction files, `MEMORY.md`, `resources/`, and whether `codebase-memory-mcp` is registered.
2. Add **only** missing pieces:
   - Missing scaffold files (`AGENTS.md`, `CLAUDE.md`, `MEMORY.md`, `PLAN.md`).
   - Missing GitHub/Linear metadata.
   - Missing code-index registration (see `memory-and-indexing.md`).
3. Preserve project-specific instructions. Never replace a hand-written `AGENTS.md`/`CLAUDE.md` with a generic template unless the user explicitly asks.
4. Update `PROJECTS.md` and the root routing map.
5. Report what's still missing (unfilled GitHub/Linear links, pending index) instead of silently inventing it.

## Guardrail

Surgical changes only. If you notice unrelated dead scaffold, mention it — don't delete it unless asked.
