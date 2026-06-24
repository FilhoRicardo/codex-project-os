# Plan Review — loop details

Loaded on demand by `plan-review`. Keep the SKILL body lean; the depth lives here.

## Auth preflight (run once)

```bash
claude --version
claude -p --tools "" --permission-mode plan 'Return exactly: OK'
```

If the smoke test returns `401 Invalid authentication credentials` or another auth error, stop and ask the user to run `claude login`. Do not silently skip the gate.

## PLAN.md shape

```md
# Plan: [short title]

## Goal
## Acceptance Criteria
## Approach
## Key Decisions And Tradeoffs
## Risks And Unknowns
## Out Of Scope
## Verification
## Linear And Memory Impact
```

## Build the prompt

Write `PLAN.md` (plus any still-open critique from a prior round) into `/tmp/plan-review.txt` wrapped in this template:

```text
You are Claude acting as devil's advocate for a Codex-owned implementation plan.
Codex is the executor and final arbiter. Make the plan sharper before any code is written.

Be skeptical and specific. Look for:
- ambiguous requirements or missing acceptance criteria
- hidden assumptions and untested dependencies
- Linear/memory implications that are missing
- architecture, data-flow, security, privacy, or migration risks
- unnecessary scope and simpler alternatives
- verification gaps

For each issue give: Concern / Why it matters / One-line fix or question.
Do not write code. Do not ask to edit files. Do not be agreeable for politeness.

End with exactly one final line:
VERDICT: CLEAR
or
VERDICT: REVISE

PLAN:
[paste PLAN.md here]
```

## Run it (read-only, no tools)

```bash
claude -p --tools "" --permission-mode plan "$(cat /tmp/plan-review.txt)" > /tmp/plan-verdict.txt
```

## After the round

- Append the full critique to `PLAN-REVIEW-LOG.md` with a date and round number.
- If `VERDICT: CLEAR`, stop and ask the user for signoff.
- If `VERDICT: REVISE`, Codex revises `PLAN.md` and logs accepted vs rejected critique (with reasons). Default: stop here and ask the user. Run another round only if the user asks. Cap at 3.
- At the cap without `CLEAR`, present the unresolved disagreements and let the user decide. Never fake agreement.
