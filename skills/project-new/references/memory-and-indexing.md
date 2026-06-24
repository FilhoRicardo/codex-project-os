# Memory + code indexing

Two layers, kept separate so neither bloats:

1. **`MEMORY.md`** — durable *human* decisions, in prose. Small on purpose.
2. **`codebase-memory-mcp`** — the *code* knowledge graph. Replaces hand-written code maps.

## codebase-memory-mcp

A single static binary that indexes the repo into a queryable knowledge graph — ~120× fewer tokens for structural questions than file-by-file grep/read. It auto-detects Codex CLI and Claude Code and wires up the MCP entry for you.

Install once on the machine:

```bash
curl -fsSL https://raw.githubusercontent.com/DeusData/codebase-memory-mcp/main/install.sh | bash
```

Then, for a managed code project, after the repo exists and `.gitignore` protects secrets/logs/generated data:

- Restart the agent and say **"Index this project"** (or run the binary's `install`/index step in the project dir).
- Agents should query the graph **before** broad codebase exploration, using MCP tools like:
  - `search_graph` — find functions/classes/routes by name or file pattern.
  - `trace_path` — who calls X / what X calls (BFS, depth 1–5).
  - `get_architecture` — languages, packages, routes, hotspots in one call.
  - `query_graph` — read-only Cypher-like queries.
  - `detect_changes` — map uncommitted changes to affected symbols + risk.

Set it up only after the repo and ignore rules are safe. Don't commit any local index cache the tool writes.

## MEMORY.md rules

- Headings: Source Links, Key Decisions, Constraints, Durable Outcomes.
- One or two sentences per entry.
- Update after setup and when durable context changes — not as a task log, not a second issue tracker.
- Routine re-indexing is **not** a memory event. Only the decision to adopt or change the indexing policy is.

## Why this split saves tokens

The old flow hand-maintained a code map and narrated structure into prose memory. Now structure lives in a graph the agent queries on demand, and `MEMORY.md` only holds the few decisions a graph can't infer.
