---
name: plan-review
description: One-time devil's-advocate grilling of a PLAN before implementation starts. Codex executes; Claude CLI critiques read-only. Use ONLY at the planning gate — new project initiation or a major plan rewrite the user explicitly flags. Do NOT use for individual features, Linear issues, routine code, or everyday decisions.
---

# Plan Review (planning gate only)

Codex owns execution. Claude is a read-only devil's advocate that grills the plan **once** so it is clear before any code is written.

## When to use

- A new managed project is being initiated.
- The user explicitly says to re-grill after a **major** plan rewrite.

## When NOT to use (this is the whole point)

- Individual feature work or a single Linear issue.
- Routine code, schema, or config decisions during implementation.
- Anything where a plan already passed this gate. The gate runs **once per plan**, not per decision.

If you are unsure, default to NOT invoking. Per-decision grilling is what made the old workflow burn tokens.

## Loop (single pass by default)

1. Ensure `PLAN.md` exists and follows the shape in `references/loop.md`.
2. Run Claude once, read-only, with the prompt template in `references/loop.md`:
   ```bash
   claude -p --tools "" --permission-mode plan "$(cat /tmp/plan-review.txt)" > /tmp/plan-verdict.txt
   ```
3. Append Claude's critique to `PLAN-REVIEW-LOG.md`.
4. Codex revises `PLAN.md`, logging what it accepted and what it rejected (with reasons).
5. Ask the user for signoff.

**Default is one round.** Only run a second or third round if the user asks. Hard cap: 3. Never fake agreement — if disagreements remain, surface them and let the user decide.

Full prompt template, PLAN shape, and auth preflight: `references/loop.md`.

## Hard rules

- Claude never edits files or runs code here.
- Codex accepts useful critique and rejects weak critique with a logged reason.
- Implementation starts only after user signoff.
