# Graphify Layer

Graphify adds a queryable project map to managed code projects. It is useful when an agent needs architecture, dependency, file-relationship, or data-flow context without rereading the whole repository.

Upstream: https://github.com/safishamsi/graphify

## When To Use It

Use Graphify for managed code projects once the repository exists and ignore rules are safe.

Do not run Graphify before checking `.gitignore` for secrets, local logs, generated data, and personal files.

## One Command

From a Projects root created by this framework:

```bash
./scripts/setup-graphify.sh active/[project] --build --obsidian --hooks
```

Without `--build`, the script installs project-scoped Graphify support and ignore rules only:

```bash
./scripts/setup-graphify.sh active/[project]
```

Useful options:

```bash
./scripts/setup-graphify.sh active/[project] --build
./scripts/setup-graphify.sh active/[project] --obsidian
./scripts/setup-graphify.sh active/[project] --obsidian-dir graphify-out/obsidian
./scripts/setup-graphify.sh active/[project] --hooks
```

`--build` uses `graphify update .`, the code-only path that does not require an LLM API key. Use the full Graphify semantic extraction flow separately when you intentionally want doc, paper, image, or deep inferred edges.

`--obsidian` exports graph notes and `graph.canvas`. If the Projects root has `.obsidian`, the default export directory is `<Projects root>/graphify/[project]/`, which keeps generated node notes in one vault folder and out of each project git repo. Without a parent Obsidian vault, the fallback is `graphify-out/obsidian/`.

`--hooks` runs `graphify hook install`, which installs post-commit and post-checkout git hooks. The post-commit hook updates the code graph in the background after each commit; doc, paper, and image changes still need a manual semantic Graphify run.

## What It Creates

Graphify may create:

```text
graphify-out/
  graph.html
  GRAPH_REPORT.md
  graph.json
```

When the Projects root is an Obsidian vault, `--obsidian` also creates:

```text
<Projects root>/graphify/[project]/
  graph.canvas
  *.md
```

It may also create project-scoped assistant files such as `.agents/skills/graphify/` or `.claude/skills/graphify/`.

## Commit Policy

Commit:

- `graphify-out/GRAPH_REPORT.md`
- `graphify-out/graph.json`
- `graphify-out/graph.html` when useful
- `graphify-out/obsidian/` only when intentionally exporting Obsidian notes inside the project repo
- project-scoped Graphify skill/config files

Do not commit:

- `graphify-out/cost.json`
- `graphify-out/cache/`
- any generated graph output that includes private local data
- `<Projects root>/graphify/[project]/` because it is a vault-local Obsidian export outside the project repo

## Agent Rules

When `graphify-out/graph.json` exists:

- For broad codebase questions, run `graphify query "<question>"` before broad grep or raw file browsing.
- Use `graphify path "<A>" "<B>"` for relationships.
- Use `graphify explain "<concept>"` for focused concepts.
- Read `graphify-out/GRAPH_REPORT.md` for broad architecture review.
- After meaningful code changes, run `graphify update .` when the graph exists.
- When git hooks are installed, expect the graph to refresh after commits; inspect `~/.cache/graphify-rebuild.log` if the hook fails.

If Graphify is missing or the graph is stale, say so plainly and continue with normal code inspection.
