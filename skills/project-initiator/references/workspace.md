# Workspace Reference

## Paths

- Workspace root: `<PROJECTS_ROOT>`
- Active projects: `<PROJECTS_ROOT>/active`
- Project registry: `<PROJECTS_ROOT>/PROJECTS.md`
- Root instructions: `<PROJECTS_ROOT>/AGENTS.md` and `<PROJECTS_ROOT>/CLAUDE.md`
- Templates:
  - Basic: `<PROJECTS_ROOT>/resources/project-templates/codex-basic`
  - Managed: `<PROJECTS_ROOT>/resources/project-templates/codex-managed`
- Voice principles: `<PROJECTS_ROOT>/resources/voice-principles.md`
- Codex skill for Claude challenge loop: `<CODEX_SKILLS_ROOT>/claude-devil-review`

## PROJECTS.md Row

Use this shape:

```md
| Project | `active/folder` | `AGENTS.md`, `CLAUDE.md` | GitHub URL or Create/link required | Linear URL or Create/link required | Status |
```

Status values:

- `Linked`
- `Needs Linear`
- `Needs GitHub`
- `Needs decision`

## Routing Map Row

Use this shape in root `AGENTS.md`:

```md
| project-name | Working on the project outcome or primary trigger. |
```

## Placeholder Discipline

- Do not invent GitHub or Linear URLs.
- Do not copy root `MEMORY.md` into projects.
- Use `Create/link required` when a managed project still needs a repo or Linear project.
- Keep changes surgical: template copy, placeholder replacement, registry row, Routing Map row.

## Plan Discipline

- Codex is the executor.
- Claude is the devil's advocate for managed project planning.
- For managed projects, create `PLAN.md` and `PLAN-REVIEW-LOG.md` during scaffold setup.
- `AGENTS.md` is Codex executor guidance; `CLAUDE.md` is Claude critic-only guidance.
- Never mirror `CLAUDE.md` from `AGENTS.md`.
- Do not write code before user signoff on the reviewed plan.

## Memory Discipline

- Project `MEMORY.md` stores durable project context, not task logs.
- Use sections: Contacts, Source Links, Key Decisions, and Durable Outcomes.
- Add one or two sentence entries for decisions, constraints, links, architecture choices, shipped outcomes, and important handoff context.
- Every Linear issue creation or closure requires a memory touch. Update memory only when durable context changed; otherwise report that no memory update was needed.
