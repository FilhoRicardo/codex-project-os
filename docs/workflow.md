# Workflow

## Roles

- Codex executes.
- Claude critiques.
- Linear tracks work.
- GitHub ships code.
- Memory preserves durable context.
- Graphify maps code and docs when a managed code project needs a queryable architecture graph.

## New Managed Project Flow

1. Start in your Projects root.
2. Ask Codex to initiate a managed project.
3. Codex interviews you for missing essentials.
4. Codex drafts `PLAN.md`.
5. Claude challenges the plan for up to five rounds.
6. Codex updates the plan or rejects weak critique with reasons.
7. You sign off.
8. Codex creates a private GitHub repo, Linear project, and first Linear issue by default.
9. For managed code projects, Codex prepares Graphify after repo and ignore rules are safe.
10. Codex executes from Linear issues.
11. Codex updates `MEMORY.md` only when durable context changes.

Say `local-only`, `basic`, `skip GitHub`, `skip Linear`, or `public GitHub repo` when you want a different path.

## The Planning Gate

Non-trivial work should pass through:

```text
PLAN.md -> Claude critique -> PLAN-REVIEW-LOG.md -> user signoff -> implementation
```

Trivial local-only work can skip the gate when the user says so.

## Graph Layer

When `graphify-out/graph.json` exists, agents should query Graphify before broad codebase exploration:

```bash
graphify query "how does authentication reach the database?"
```

See `docs/graphify.md`.
