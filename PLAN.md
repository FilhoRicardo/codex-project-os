# Plan: Add Graphify Layer To Managed Projects

## Goal

Add a lean Graphify knowledge-graph layer to Codex Project OS so managed code projects can maintain a queryable architecture map without making the scaffold heavy.

## Acceptance Criteria

- Managed templates include Graphify-aware Codex and Claude instructions.
- Project initiation guidance includes Graphify setup after GitHub/Linear and secret-ignore checks.
- A small helper script installs Graphify and project-scoped agent support from a project root.
- Docs explain the one-command setup, generated files, update flow, and safety rules.
- The public `project-initiator` skill and the installed local copy are updated.
- Skills validate and the public repo passes the private-string scan before push.
- RF-82 adds Obsidian export and post-commit/post-checkout hook guidance.

## Approach

Add a `docs/graphify.md` guide, a `scripts/setup-graphify.sh` helper, template Graph Layer sections, and concise project-initiator rules. Keep Graphify as an external dependency installed by command, not vendored code.

## Key Decisions And Tradeoffs

- Graphify is optional-by-default for managed code projects: the scaffold knows how to use it, but basic/local-only projects are not forced into it.
- Run secret and local-data ignore checks before generating or committing `graphify-out/`.
- Commit durable graph artifacts when appropriate; ignore local cost/cache files.
- Use Graphify queries for broad codebase questions when `graphify-out/graph.json` exists.
- Export Obsidian graph notes into `<Projects root>/graphify/[project]/` so Projects roots that are Obsidian vaults can read them without dirtying project repos or polluting the vault root.
- Install native Graphify hooks when requested so code graphs update after commits.

## Risks And Unknowns

- Graphify can surface local content, so projects with secrets or personal data need ignore checks first.
- `graphify` install behavior may evolve, so the helper stays small and transparent.
- Claude review is unavailable for this pass because the user reported being out of Claude credits.

## Out Of Scope

- Vendoring Graphify.
- Running Graphify across all existing active projects.
- Making Graphify mandatory for basic/local-only projects.
- Installing hooks automatically without user intent.
- Exporting generated Obsidian node notes into the public scaffold repo by default.

## Verification

- Validate `skills/project-initiator`.
- Validate `skills/claude-devil-review`.
- Run shell syntax check on `scripts/setup-graphify.sh`.
- Grep for private strings.
- Inspect git diff before commit.

## GitHub, Linear, And Memory Impact

- Linear issue: RF-79.
- Linear issue: RF-82.
- GitHub repo: public `FilhoRicardo/codex-project-os`.
- Memory: update only with durable framework decision after implementation.
