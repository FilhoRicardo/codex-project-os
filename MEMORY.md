# Memory — codex-project-os

Durable framework decisions only.

## Key Decisions

- v2 rebuild: collapsed to two skills (`project-new`, `plan-review`) with progressive disclosure to cut token cost.
- The Codex↔Claude grilling loop is bounded to the planning gate, single pass by default (cap 3). Never per-decision.
- Code indexing is delegated to `codebase-memory-mcp` (replaces the old Graphify layer). `MEMORY.md` holds only durable human decisions.
- Linear stays the scope source of truth; GitHub the code source of truth.
