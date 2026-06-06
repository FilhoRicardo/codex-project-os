# Linear, GitHub, And Memory

Every managed project keeps four fields visible:

- Project folder
- GitHub repo
- Linear project
- Linear issue

## Linear

Linear is the source of truth for scope, acceptance criteria, priorities, and status.

Every issue creation or closure triggers a memory touch. Update `MEMORY.md` only if durable project context changed.

## GitHub

GitHub is the source of truth for branches, pull requests, review, and shipped code.

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
