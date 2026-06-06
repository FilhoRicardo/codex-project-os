# Workflow

## Roles

- Codex executes.
- Claude critiques.
- Linear tracks work.
- GitHub ships code.
- Memory preserves durable context.

## New Managed Project Flow

1. Start in your Projects root.
2. Ask Codex to initiate a managed project.
3. Codex interviews you for missing essentials.
4. Codex drafts `PLAN.md`.
5. Claude challenges the plan for up to five rounds.
6. Codex updates the plan or rejects weak critique with reasons.
7. You sign off.
8. Codex creates or links GitHub and Linear.
9. Codex executes from Linear issues.
10. Codex updates `MEMORY.md` only when durable context changes.

## The Planning Gate

Non-trivial work should pass through:

```text
PLAN.md -> Claude critique -> PLAN-REVIEW-LOG.md -> user signoff -> implementation
```

Trivial local-only work can skip the gate when the user says so.
