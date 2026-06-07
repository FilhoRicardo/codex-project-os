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
- Graphify setup helper: `<PROJECTS_ROOT>/scripts/setup-graphify.sh`
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
- Managed projects create a private GitHub repo and Linear project by default.
- Managed code projects prepare Graphify after GitHub exists and ignore rules are safe.
- Use `Create/link required` only when tool access fails, the user explicitly opts out, or an existing external record must be linked later.
- Keep changes surgical: template copy, placeholder replacement, registry row, Routing Map row.

## Default Creation Targets

- GitHub owner: infer from the authenticated `gh` account unless the user specifies another owner.
- GitHub visibility: private by default; public only when explicitly requested.
- Linear team: use the configured/default team unless the user specifies another team.
- First Linear issue title: `Initialize [Project Name]`.
- Graphify setup: run `scripts/setup-graphify.sh active/[folder] --hooks` after ignore safety; add `--build --obsidian` when code exists and the Projects root is an Obsidian vault.

## Plan Discipline

- Codex is the executor.
- Claude is the devil's advocate for managed project planning.
- For managed projects, create `PLAN.md` and `PLAN-REVIEW-LOG.md` during scaffold setup.
- `AGENTS.md` is Codex executor guidance; `CLAUDE.md` is Claude critic-only guidance.
- Never mirror `CLAUDE.md` from `AGENTS.md`.
- Do not write code before user signoff on the reviewed plan.
- Use Graphify for broad codebase questions when `graphify-out/graph.json` exists.

## Memory Discipline

- Project `MEMORY.md` stores durable project context, not task logs.
- Use sections: Contacts, Source Links, Key Decisions, and Durable Outcomes.
- Add one or two sentence entries for decisions, constraints, links, architecture choices, shipped outcomes, and important handoff context.
- Record initial Graphify adoption as durable context; routine graph updates are not memory entries.
- Every Linear issue creation or closure requires a memory touch. Update memory only when durable context changed; otherwise report that no memory update was needed.
