# Graphify Layer

Graphify adds a queryable project map to managed code projects. It is useful when an agent needs architecture, dependency, file-relationship, or data-flow context without rereading the whole repository.

Upstream: https://github.com/safishamsi/graphify

## When To Use It

Use Graphify for managed code projects once the repository exists and ignore rules are safe.

Do not run Graphify before checking `.gitignore` for secrets, local logs, generated data, and personal files.

## One Command

From a Projects root created by this framework:

```bash
./scripts/setup-graphify.sh active/[project] --build
```

Without `--build`, the script installs project-scoped Graphify support and ignore rules only:

```bash
./scripts/setup-graphify.sh active/[project]
```

Optional hook:

```bash
./scripts/setup-graphify.sh active/[project] --hooks
```

## What It Creates

Graphify may create:

```text
graphify-out/
  graph.html
  GRAPH_REPORT.md
  graph.json
```

It may also create project-scoped assistant files such as `.agents/skills/graphify/` or `.claude/skills/graphify/`.

## Commit Policy

Commit:

- `graphify-out/GRAPH_REPORT.md`
- `graphify-out/graph.json`
- `graphify-out/graph.html` when useful
- project-scoped Graphify skill/config files

Do not commit:

- `graphify-out/cost.json`
- `graphify-out/cache/`
- any generated graph output that includes private local data

## Agent Rules

When `graphify-out/graph.json` exists:

- For broad codebase questions, run `graphify query "<question>"` before broad grep or raw file browsing.
- Use `graphify path "<A>" "<B>"` for relationships.
- Use `graphify explain "<concept>"` for focused concepts.
- Read `graphify-out/GRAPH_REPORT.md` for broad architecture review.
- After meaningful code changes, run `graphify update .` when the graph exists.

If Graphify is missing or the graph is stale, say so plainly and continue with normal code inspection.
