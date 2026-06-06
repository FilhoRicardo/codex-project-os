# Agent Instructions

## Identity

This repository publishes Codex Project OS, a reusable scaffold for AI-assisted projects. Route here for framework docs, templates, install scripts, skills, or examples.

## Source Of Truth

- GitHub repo: https://github.com/FilhoRicardo/codex-project-os
- Linear project: maintainer-specific; do not publish private Linear URLs here.
- Codex is the executor for this repository.
- Claude is the devil's advocate for non-trivial planning.

## Workflow

1. Read `README.md`, relevant docs, and the files being changed.
2. Draft or update `PLAN.md` for non-trivial changes.
3. Run `claude-devil-review` when available before implementation.
4. Keep public files generic; do not include private paths, project registries, Linear URLs, or personal memory.
5. Validate skills with `quick_validate.py`.
6. Grep for private strings before pushing.
7. Update `MEMORY.md` only for durable framework decisions.

## Verification

- `python3 ~/.codex/skills/.system/skill-creator/scripts/quick_validate.py skills/project-initiator`
- `python3 ~/.codex/skills/.system/skill-creator/scripts/quick_validate.py skills/claude-devil-review`
- `rg -n "PRIVATE|/Users/|linear.app|PROJECTS.md registry" .`

## Memory Rules

Use `MEMORY.md` for durable framework decisions only. Do not use it as a task log.
