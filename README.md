# Codex Project OS

A lightweight operating system for AI-assisted software projects.

Codex executes. Claude critiques. Linear tracks. GitHub ships. Memory preserves decisions.

## What This Is

Codex Project OS gives every project a repeatable structure so AI coding sessions do not start from zero each time.

It separates the roles clearly:

- `AGENTS.md` tells Codex how to execute.
- `CLAUDE.md` tells Claude how to challenge the plan.
- `PLAN.md` captures the current accepted plan.
- `PLAN-REVIEW-LOG.md` stores the critique loop.
- `MEMORY.md` stores durable decisions, source links, constraints, and outcomes.
- Linear tracks scope and acceptance criteria.
- GitHub tracks branches, pull requests, and shipped code.

## Included

- Project root scaffold.
- Basic and managed project templates.
- Codex skill: `project-initiator`.
- Codex skill: `claude-devil-review`.
- Setup and workflow docs.
- A sample managed project.

## Quick Start

Clone the repo:

```bash
git clone https://github.com/FilhoRicardo/codex-project-os.git
cd codex-project-os
```

Install the Codex skills:

```bash
./scripts/install-skills.sh
```

Create a new Projects root:

```bash
./scripts/bootstrap-projects-root.sh ~/Documents/Projects
```

Then open Codex in that root folder and say:

```text
Initiate a managed project for [your idea]
```

Managed projects create a private GitHub repo, Linear project, and first Linear issue by default. Say `local-only`, `basic`, `skip GitHub`, `skip Linear`, or `public GitHub repo` when you want a different path.

## The Managed Project Shape

```text
active/[project]/
  AGENTS.md
  CLAUDE.md
  PLAN.md
  PLAN-REVIEW-LOG.md
  MEMORY.md
  resources/
```

## The Rule

Codex owns execution. Claude owns critique. The user owns final signoff.

No meaningful implementation starts until the reviewed plan is clear.

## Acknowledgement

This framework was influenced by the plan-grilling pattern in `chaseai-yt/grill-me-codex`, especially the idea of hardening a plan before code starts.
