# Codex Project OS

A **lean** operating system for AI-assisted projects. Codex executes. Claude grills the plan **once**. Linear tracks scope. `codebase-memory-mcp` indexes the code. Memory keeps the few decisions a graph can't infer.

> v2 rebuild. The previous version grilled every non-trivial decision through a 5-round Claude loop and loaded a 120-line skill on every trigger — it burned tokens fast. This version keeps the parts that mattered (planning rigor, Linear, memory/indexing) and cuts the rest.

## What changed in v2

| Problem (v1) | Fix (v2) |
|---|---|
| `claude-devil-review` fired before features, issues, schemas, auth, migrations — up to 5 rounds each | `plan-review` fires **only at the planning gate**, single pass by default (cap 3) |
| 121-line `project-initiator` SKILL loaded entirely on every trigger | Thin `SKILL.md` (~35 lines) + `references/` loaded on demand |
| Bespoke Graphify code-map, hand-maintained | `codebase-memory-mcp` — one binary, ~120× fewer tokens for structural queries |
| `MEMORY.md` narrated code structure | `MEMORY.md` holds durable human decisions only; the graph holds structure |

Patterns borrowed from [addyosmani/agent-skills](https://github.com/addyosmani/agent-skills) (progressive disclosure, plugin packaging), [mattpocock/skills](https://github.com/mattpocock/skills) (small composable skills, planning-time grilling), and [DeusData/codebase-memory-mcp](https://github.com/DeusData/codebase-memory-mcp) (code indexing).

## The three pillars (kept, improved)

- **Planning gate** — one Codex↔Claude grilling pass before code, never per decision.
- **Linear** — source of truth for scope; private GitHub repo for code, by default.
- **Memory & indexing** — durable decisions in `MEMORY.md`; code structure in the graph.

## Install

```bash
git clone https://github.com/FilhoRicardo/codex-project-os.git
cd codex-project-os
./scripts/setup.sh
# optional but recommended:
curl -fsSL https://raw.githubusercontent.com/DeusData/codebase-memory-mcp/main/install.sh | bash
```

Then open Codex or Claude Code and run the `project-new` skill:

```text
Start a managed project for <your idea>
```

## Layout

```
skills/
  project-new/    SKILL.md + references/  (create, repair, linear, memory-and-indexing)
  plan-review/    SKILL.md + references/  (loop)  — planning gate only
templates/
  managed/  basic/  projects-root/
scripts/setup.sh
docs/  setup.md  workflow.md  memory-and-indexing.md
```

## The rule

Codex owns execution. Claude grills the plan once. The user signs off. No code starts until the plan is clear — and the grilling does not repeat for every decision.

## License

MIT
