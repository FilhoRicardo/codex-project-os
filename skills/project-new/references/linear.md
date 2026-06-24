# Linear + GitHub — the tracking layer

Loaded on demand. Linear stays the source of truth for scope; GitHub for code. Keep this lean.

## Four fields, always visible

Every managed project keeps these in `PROJECTS.md`:

| Field | Source of truth |
|-------|-----------------|
| Project folder | `active/<slug>/` |
| GitHub repo | branches, PRs, shipped code |
| Linear project | roadmap, scope, status |
| Linear issue | acceptance criteria for the current unit of work |

## Defaults

- Managed projects create a **private** GitHub repo (public only if the user asks).
- Managed projects create a Linear **project + first issue**, unless the user links existing records or opts out.
- Non-trivial code work gets a Linear issue **before** implementation.
- Branches/PRs reference the Linear issue when one exists.

## Issue lifecycle → memory touch

When you create or close a Linear issue, do a memory touch: update project `MEMORY.md` **only if** durable knowledge changed (a decision, constraint, architecture choice, link, or shipped outcome). If nothing durable changed, say "no memory update needed." `MEMORY.md` is not an issue log.

## When tools are unavailable

Write `Create/link required` and state the blocker. Never invent a Linear or GitHub URL.
