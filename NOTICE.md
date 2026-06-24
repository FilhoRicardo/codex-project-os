# Attribution

This scaffold incorporates work from three upstream projects, all MIT-licensed.

## Vendored skills (faithful copies, unmodified)

From [addyosmani/agent-skills](https://github.com/addyosmani/agent-skills) (MIT):

- `skills/spec-driven-development/`
- `skills/incremental-implementation/`
- `skills/shipping-and-launch/`

These are model-invoked on demand, so they add capability without loading into base context.

## Patterns incorporated

- **`skills/plan-review/`** folds in the relentless one-question-at-a-time interview pattern from [mattpocock/skills](https://github.com/mattpocock/skills) `grilling`, ahead of the Claude devil's-advocate critique.
- **Progressive disclosure** (thin `SKILL.md` + `references/`) and plugin/marketplace packaging follow [addyosmani/agent-skills](https://github.com/addyosmani/agent-skills).

## Dependency

- **Code indexing** is delegated to [DeusData/codebase-memory-mcp](https://github.com/DeusData/codebase-memory-mcp) (MIT), installed separately. See `docs/memory-and-indexing.md`.
