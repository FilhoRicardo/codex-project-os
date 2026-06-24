# Memory — codex-project-os

Durable framework decisions only.

## Key Decisions

- v2 rebuild: collapsed to two skills (`project-new`, `plan-review`) with progressive disclosure to cut token cost.
- v3: vendored 3 agent-skills lifecycle skills (`spec-driven-development`, `incremental-implementation`, `shipping-and-launch`, model-invoked on demand) and folded the mattpocock `grilling` one-question-at-a-time interview into `plan-review`. Version bumped to 3.0.0; announcement banner is "lets build it Ricardo - we are using v3 now".
- The Codex↔Claude grilling loop is bounded to the planning gate, single pass by default (cap 3). Never per-decision.
- Code indexing is delegated to `codebase-memory-mcp` (replaces the old Graphify layer). `MEMORY.md` holds only durable human decisions.
- Linear stays the scope source of truth; GitHub the code source of truth.
