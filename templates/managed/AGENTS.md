# Agents — <PROJECT_NAME>

## Identity

Route here for work on <PROJECT_NAME> (`active/<SLUG>/`). Outcome: <OUTCOME>.

## Source of truth

- GitHub: <GITHUB_URL>
- Linear project: <LINEAR_URL>
- Codex executes. Claude grills the plan once at the planning gate (see the `plan-review` skill).

## Workflow

1. Read this file, `MEMORY.md`, and the linked Linear issue before touching code.
2. For a new plan only, run `plan-review` once, then get user signoff. Do not re-grill per feature.
3. Query `codebase-memory-mcp` (`search_graph`, `trace_path`, `get_architecture`) before broad code exploration.
4. Non-trivial code work gets a Linear issue first; branches/PRs reference it.
5. Verify with: `<VERIFY_CMD>`.
6. Update `MEMORY.md` only when durable context changes.

## Memory

`MEMORY.md` holds durable decisions, not a task log.
