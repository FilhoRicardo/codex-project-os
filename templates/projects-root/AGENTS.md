# AGENTS.md

## Memory System

At the start of every session, read `MEMORY.md` before responding. Use what you find to inform your work.

When the user says "remember this," write durable facts to `MEMORY.md` immediately and confirm.

## Project Management Scaffold

Active project folders live in `active/`. Before project work:

- When initiating a new project or repairing a scaffold, use the `project-initiator` skill if available.
- For managed projects, Codex is the executor and Claude is the devil's advocate.
- Do not mirror `CLAUDE.md` from `AGENTS.md`.
- Use `PROJECTS.md` and the Routing Map to identify the project folder.
- Read project `AGENTS.md` for execution, project `MEMORY.md` for durable context, and project `CLAUDE.md` only for the critic contract.
- Keep four fields visible: project folder, GitHub repo, Linear project, and Linear issue.
- Before non-trivial code work, confirm GitHub and Linear linkage.
- Use Linear for scope and acceptance criteria.
- Use GitHub for branches, pull requests, and shipped code.
- Update project `MEMORY.md` when durable context changes.
- Every Linear issue creation or closure requires a memory touch.

## Routing Map

| Project | Route here when I... |
|---|---|

## Creating New Projects

When creating a managed project, create:

- `AGENTS.md` for Codex executor instructions.
- `CLAUDE.md` for Claude critic-only instructions.
- `PLAN.md` for the current plan.
- `PLAN-REVIEW-LOG.md` for critique rounds.
- `MEMORY.md` for durable context.
- `resources/` for project-specific references.

After creating the project, update this Routing Map and `PROJECTS.md`.
