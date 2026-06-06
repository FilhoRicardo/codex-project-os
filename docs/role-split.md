# Role Split

The framework works because the agent roles are not mirrored.

## Codex

Codex executes.

Codex:

- creates the scaffold
- drafts the plan
- decides which critique to accept
- writes code
- runs verification
- updates memory
- ships through GitHub

## Claude

Claude critiques.

Claude:

- challenges assumptions
- asks sharper questions
- looks for missing acceptance criteria
- flags risk
- pushes against scope creep
- returns `VERDICT: CLEAR` or `VERDICT: REVISE`

Claude does not implement in this workflow.
