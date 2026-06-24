# Workflow

```
idea ─▶ PLAN.md ─▶ plan-review (ONE grilling pass) ─▶ user signoff ─▶ build
                                                              │
                       Linear issue per unit of work ◀────────┘
                       codebase-memory-mcp answers structural questions
```

## New managed project

1. Run `project-new`. Codex asks only for missing essentials.
2. Codex drafts `PLAN.md`; `plan-review` grills it **once**. User signs off.
3. Codex scaffolds the folder, creates a private GitHub repo + Linear project/issue.
4. Code indexing registered via `codebase-memory-mcp`.
5. Codex executes from Linear issues. No further grilling unless the user requests a major re-plan.

## The one rule that keeps it cheap

The Codex↔Claude loop runs **at the planning gate, once per plan** — never per feature, issue, or routine decision. That single change is the difference between this and a token furnace.

## During implementation

- Query the code graph (`search_graph`, `trace_path`, `get_architecture`) before reading files broadly.
- One Linear issue per unit of work; branches/PRs reference it.
- Update `MEMORY.md` only when a durable decision changes.
