---
name: claude-devil-review
description: Codex-led planning loop where Codex is the executor and Claude CLI is the read-only devil's advocate. Use before non-trivial project initiation, feature implementation, Linear issue execution, architecture changes, schemas, auth, integrations, migrations, or whenever the user asks Claude to grill, challenge, antagonize, stress-test, or act as devil's advocate before Codex implements.
---

# Claude Devil Review

Use this skill to make Codex own execution while Claude challenges the plan until it is clear enough to implement.

## Roles

- **Codex** is the executor, planner, editor, and final arbiter.
- **Claude** is the devil's advocate. Claude challenges assumptions, gaps, risks, ambiguity, and simpler alternatives.
- **User** is the final gate. No implementation starts until the user approves the reviewed plan.

## Preflight

1. Work in the project folder.
2. Read `AGENTS.md` for Codex execution rules, `CLAUDE.md` for the critic contract, `MEMORY.md`, the Linear issue when linked, and relevant local files.
3. Verify Claude CLI is available with `claude --version`.
4. Verify Claude auth with a tiny no-tools smoke test: `claude -p --tools "" --permission-mode plan 'Return exactly: OK'`.
5. If the smoke test returns `401 Invalid authentication credentials` or another auth error, stop and ask the user to run `claude login` or configure Claude credentials. Do not silently skip the review.
6. Default `MAX_ROUNDS=5` unless the user asks for fewer.
7. Create or update `PLAN.md` and `PLAN-REVIEW-LOG.md`.

## PLAN.md Shape

Write the plan before asking Claude to review:

```md
# Plan: [short title]

## Goal

## Acceptance Criteria

## Approach

## Key Decisions And Tradeoffs

## Risks And Unknowns

## Out Of Scope

## Verification

## GitHub, Linear, And Memory Impact
```

## Claude Review Loop

Use up to `MAX_ROUNDS` rounds.

1. Build a prompt from `PLAN.md` plus any previous unresolved critique.
2. Run Claude in non-interactive, no-tools mode so it cannot edit files:

```bash
claude -p --tools "" --permission-mode plan "$(cat /tmp/claude-devil-prompt.txt)" > /tmp/claude-devil-verdict.txt
```

3. Claude's prompt must ask for skeptical review and require the final line to be exactly:
   - `VERDICT: CLEAR` when the plan is clear enough to implement.
   - `VERDICT: REVISE` when material ambiguity or risk remains.
4. Append the full Claude critique to `PLAN-REVIEW-LOG.md`.
5. If `CLEAR`, stop the loop and ask the user for final signoff.
6. If `REVISE`, Codex decides what to accept. Revise `PLAN.md`, log what changed, and log any rejected critique with reasons.
7. If the loop hits `MAX_ROUNDS` without `CLEAR`, do not fake agreement. Present unresolved disagreements and ask the user to decide.

## Claude Prompt Template

Use this as the prompt body, inserting the current plan:

```text
You are Claude acting as devil's advocate for a Codex-owned implementation plan.

Codex is the executor and final arbiter. Your job is to make the plan sharper before any code is written.

Be skeptical and specific. Look for:
- ambiguous requirements
- hidden assumptions
- missing acceptance criteria
- missing GitHub/Linear/memory implications
- architecture or data-flow risks
- security, privacy, migration, concurrency, or integration risks
- unnecessary scope
- simpler alternatives
- verification gaps

Do not write code. Do not ask to edit files. Do not be agreeable for politeness.

For each issue, give:
- Concern
- Why it matters
- One-line fix or question

End with exactly one final line:
VERDICT: CLEAR
or
VERDICT: REVISE

PLAN:
[paste PLAN.md here]
```

## Memory And Linear Touch

- If the reviewed plan creates or closes a Linear issue, perform a project memory touch.
- Update `MEMORY.md` only for durable decisions, constraints, links, shipped outcomes, or handoff context.
- If nothing durable changed, say no memory update was needed.

## Hard Rules

- Claude never executes code, edits files, or drives implementation in this workflow.
- Codex does not blindly obey Claude; Codex accepts useful critique and rejects weak critique with logged reasons.
- The loop is bounded at five rounds by default.
- Code only starts after final user signoff.
