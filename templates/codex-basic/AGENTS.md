# Agent Instructions

## Identity

This project is `[PROJECT NAME]` in `<PROJECTS_ROOT>/active/[FOLDER]`. Route here when the user asks about `[ROUTING TRIGGER]`.

## Workflow

1. Read this file and relevant local files before editing.
2. State assumptions and the narrowest useful verification check.
3. Inspect git status if this folder is a git repo.
4. Make the smallest change that satisfies the request.
5. Update `MEMORY.md` when durable project context changed.
6. Verify the change and summarize the result.

## Memory Rules

- Read `MEMORY.md` at the start of project work.
- Update `MEMORY.md` after meaningful work when durable context changes.
- Store decisions, constraints, important links, shipped outcomes, and handoff context.
- Do not use `MEMORY.md` as a task log.
- Keep each memory entry to one or two sentences.

## Verification

- `[COMMAND OR MANUAL CHECK]`

## Notes

- This is a lightweight local template.
- If the project becomes active code work, upgrade it to the managed scaffold and link it in `PROJECTS.md`.
- Use the `claude-devil-review` skill before high-risk work even in a basic project.
