# Agent Instructions

## Identity

This project is `[PROJECT NAME]` in `<PROJECTS_ROOT>/active/[FOLDER]`. Route here when the user asks about `[ROUTING TRIGGER]`.

## App Design System

- For any app or frontend UI, use Aster by default unless the user explicitly provides a project-specific brand.
- Before UI work, read `<PROJECTS_ROOT>/resources/branding/aster/BRAND.md`.
- Copy or import `<PROJECTS_ROOT>/resources/branding/aster/aster-tokens.css` into the app style layer and build with its tokens/utilities.
- Do not invent a new palette, font pairing, glass recipe, shadow stack, or decorative gradient for app UI.

## Workflow

1. Read this file and relevant local files before editing.
2. State assumptions and the narrowest useful verification check.
3. Inspect git status if this folder is a git repo.
4. Apply the App Design System before app/frontend UI implementation unless a project-specific brand overrides it.
5. Make the smallest change that satisfies the request.
6. Update `MEMORY.md` when durable project context changed.
7. Verify the change and summarize the result.

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
