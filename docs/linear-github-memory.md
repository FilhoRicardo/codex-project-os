# Linear, GitHub, And Memory

Every managed project keeps four fields visible:

- Project folder
- GitHub repo
- Linear project
- Linear issue

Managed code projects may also keep a Graphify graph once the repository and ignore rules are ready.

## Linear

Linear is the source of truth for scope, acceptance criteria, priorities, and status.

Managed projects create a Linear project and first issue by default unless the user opts out or links existing Linear records.

Every issue creation or closure triggers a memory touch. Update `MEMORY.md` only if durable project context changed.

## GitHub

GitHub is the source of truth for branches, pull requests, review, and shipped code.

Managed projects create a private GitHub repo by default unless the user explicitly asks for public or links an existing repo.

Branches and pull requests should reference the Linear issue when one exists.

## Memory

`MEMORY.md` stores durable context:

- Source links
- Key decisions
- Constraints
- Architecture choices
- Shipped outcomes
- Handoff context

It is not a task log and not a second issue tracker.

## Graphify

Graphify is the optional project-map layer. It is useful durable context only when the project first adopts it or changes its graph policy. Routine graph updates do not need memory entries.
