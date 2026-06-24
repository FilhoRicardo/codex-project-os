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

## What's incorporated from the three repos

- **[DeusData/codebase-memory-mcp](https://github.com/DeusData/codebase-memory-mcp)** — the code-indexing dependency (replaces Graphify). Wired into `project-new` and `setup.sh`.
- **[addyosmani/agent-skills](https://github.com/addyosmani/agent-skills)** — three lifecycle skills vendored faithfully: `spec-driven-development`, `incremental-implementation`, `shipping-and-launch`. Plus the progressive-disclosure + plugin-packaging patterns.
- **[mattpocock/skills](https://github.com/mattpocock/skills)** — the one-question-at-a-time `grilling` pattern, folded into `plan-review`.

Vendored skills are model-invoked on demand, so they add capability without bloating base context. Full attribution in [NOTICE.md](NOTICE.md).

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
  project-new/                 your scaffolding skill (thin + references/)
  plan-review/                 planning-gate grilling + Claude critique
  spec-driven-development/     vendored from agent-skills (on demand)
  incremental-implementation/  vendored from agent-skills (on demand)
  shipping-and-launch/         vendored from agent-skills (on demand)
templates/
  managed/  basic/  projects-root/
scripts/setup.sh               installs every skill in skills/
docs/  setup.md  workflow.md  memory-and-indexing.md
NOTICE.md                      attribution for vendored work
```

## The rule

Codex owns execution. Claude grills the plan once. The user signs off. No code starts until the plan is clear — and the grilling does not repeat for every decision.

## License

MIT
