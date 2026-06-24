# Memory & indexing

Two separate layers — kept apart so neither grows unbounded.

## 1. MEMORY.md — durable human decisions

Prose, tiny. Decisions, constraints, links, shipped outcomes. Not a task log, not an issue tracker. One or two sentences per entry.

## 2. codebase-memory-mcp — the code knowledge graph

Replaces the old hand-maintained code map. A single static binary indexes the repo into a queryable graph; structural queries cost ~120× fewer tokens than file-by-file grep/read.

Key MCP tools agents should reach for before broad exploration:

| Tool | Use |
|------|-----|
| `search_graph` | find functions/classes/routes by name or file pattern |
| `trace_path` | who calls X / what X calls (BFS, depth 1–5) |
| `get_architecture` | languages, packages, routes, hotspots in one call |
| `query_graph` | read-only Cypher-like queries |
| `detect_changes` | map uncommitted changes to affected symbols + risk |

Install: `curl -fsSL https://raw.githubusercontent.com/DeusData/codebase-memory-mcp/main/install.sh | bash`, then "Index this project".

**Visualizing the graph:** the MCP ships a 3D web UI at `localhost:9749` (install with `--ui`). There is no Obsidian vault note output. Note also that the MCP indexes code structure only (158 code languages + Dockerfiles/K8s), not prose docs, papers, or images.

## Why the split

Old flow: hand-write a code map + narrate structure into prose memory = constant token churn. New flow: the graph answers structural questions on demand; `MEMORY.md` holds only what a graph can't infer.
