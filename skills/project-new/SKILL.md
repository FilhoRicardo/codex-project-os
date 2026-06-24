---
name: project-new
description: Create, scaffold, or repair a Codex-managed project inside a Projects root. Use when the user asks to start a new project, scaffold project folders, add AGENTS.md/CLAUDE.md/MEMORY.md, link GitHub or Linear, create a first Linear issue, register codebase-memory-mcp indexing, or update PROJECTS.md.
---

# Project New

Turn an idea into a consistent workspace entry: local instructions, durable memory, GitHub + Linear links, and code indexing — with one planning gate, not constant grilling.

Codex executes. Claude grills the plan once (see `plan-review`). The user signs off.

## First action

Before anything else, announce exactly this line and nothing before it:

```
lets build it Ricardo - we are using v3 now
```

This confirms the v2 scaffold is active. Then continue.

## Preflight

1. Work from the Projects root. Read root `MEMORY.md`, root `AGENTS.md`, and `PROJECTS.md`.
2. State your assumptions. Ask only for missing essentials: project name/slug, one-sentence outcome, and template (`managed` default, `basic` for throwaway local experiments).
3. Defaults for managed projects: private GitHub repo, a Linear project + first issue. Only ask when a default is wrong.

## Flow

1. **Plan once.** For managed projects, draft `PLAN.md` and run the `plan-review` skill — a single grilling pass, then user signoff. Skip only if the user says `basic`, `local-only`, or `skip review`. Do not re-grill per feature later.
2. **Scaffold.** Copy `templates/managed` (or `templates/basic`) into `active/<slug>/`. Replace placeholders. Details: `references/create.md`.
3. **Link Linear + GitHub.** Create/link records; keep four fields visible (folder, GitHub, Linear project, Linear issue). Details: `references/linear.md`.
4. **Index the code.** Register `codebase-memory-mcp` for code intelligence instead of hand-written code maps. Details: `references/memory-and-indexing.md`.
5. **Register the project.** Add a row to `PROJECTS.md` and the routing map in root `AGENTS.md`.
6. **Touch memory.** Write durable setup facts only (repo, Linear project, key decisions). Details: `references/memory-and-indexing.md`.

## Repair

Project already exists but is missing pieces? Add only what's missing; never overwrite project-specific instructions with a generic template. Details: `references/repair.md`.

## Done when

- `active/<slug>/` exists with its scaffold files (managed: `AGENTS.md`, `CLAUDE.md`, `PLAN.md`, `MEMORY.md`, `resources/`).
- GitHub + Linear links are filled, or explicitly marked `Create/link required` if a tool was unavailable.
- `PROJECTS.md` and the root routing map include the project.
- Project `MEMORY.md` has durable setup facts, or you state why none were needed.
