# Agents — codex-project-os (this repo)

This repo publishes the scaffold. It is not a managed project itself.

## Rules

- Keep it lean. The whole point is low token cost: thin `SKILL.md` bodies, depth in `references/`.
- Two skills only: `project-new` and `plan-review`. Resist adding more.
- `plan-review` is planning-gate-only. Never broaden its description to trigger per feature/issue/decision.
- Keep public files generic — no private paths, Linear URLs, or personal memory.

## Verify before pushing

```bash
rg -n "/Users/|linear.app|PRIVATE" skills templates docs   # should be empty
```
