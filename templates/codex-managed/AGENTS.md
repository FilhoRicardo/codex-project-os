# Agent Instructions

## Identity

This project is `[PROJECT NAME]` in `<PROJECTS_ROOT>/active/[FOLDER]`. Route here when the user asks about `[ROUTING TRIGGER]`. Do not route unrelated workspace, archive, or reference-only work here.

## Source of Truth

- GitHub repo: `[GITHUB URL OR Create/link required]`
- Linear project: `[LINEAR URL OR Create/link required]`
- Linear is the project-management source of truth for roadmap, issue scope, and acceptance criteria.
- GitHub is the code and PR source of truth for branches, review, and shipped changes.
- Managed setup creates a private GitHub repo, Linear project, and first Linear issue by default unless the user explicitly opts out or links existing records.
- Codex is the executor for this project.
- Claude is the devil's advocate for non-trivial planning.
- Do not mirror `CLAUDE.md` from this file; keep `CLAUDE.md` critic-only.
- At the start of every project task, check and stay aware of four fields: project folder, GitHub repo, Linear project, and Linear issue.
- Before code work, say whether the GitHub repo and Linear project/issue are linked. If either is missing, create/link it before implementation unless the user explicitly says the work is local-only.
- Before non-trivial implementation, work from a Linear issue. If no issue exists, create or link one unless the user explicitly opts out.

## Planning Gate

- Before non-trivial implementation, use the `claude-devil-review` skill when available.
- Codex drafts or updates `PLAN.md`.
- Claude challenges the plan for up to five rounds.
- Codex accepts useful critique, rejects weak critique with reasons, and logs the exchange in `PLAN-REVIEW-LOG.md`.
- Code starts only after user signoff on the reviewed plan.

## Graph Layer

- Use Graphify for managed code projects once GitHub exists and `.gitignore` protects secrets, logs, generated local data, and personal files.
- If `graphify-out/graph.json` exists and the user asks about architecture, data flow, dependencies, file relationships, or broad codebase behavior, run `graphify query "<question>"` before broad grep or raw file browsing.
- Use `graphify path "<A>" "<B>"` for relationships and `graphify explain "<concept>"` for focused concepts.
- Read `graphify-out/GRAPH_REPORT.md` for broad architecture review when a query is not enough.
- After meaningful code changes, run `graphify update .` when a graph already exists.
- Do not build or update a graph until sensitive files are ignored. Never commit `graphify-out/cost.json` or `graphify-out/cache/`.

## Resources

| Resource | Read when... |
|---|---|

## Workflow

1. Read `MEMORY.md`, this file, the Linear issue when linked, and relevant local files.
2. State assumptions, acceptance criteria, non-goals, and the narrowest useful verification check.
3. Run the Planning Gate unless the work is trivial or the user explicitly skips it.
4. Inspect git status before editing.
5. Use the Graph Layer for broad codebase questions when `graphify-out/graph.json` exists.
6. Make the smallest change that satisfies the issue or explicit user request.
7. Run the relevant verification check.
8. Update Graphify when meaningful code changed and a graph exists.
9. Update `MEMORY.md` when durable project context changed.
10. Summarize what changed, what passed, any missing Linear/GitHub linkage, graph update status, and whether memory was updated.

## Memory Rules

- Read `MEMORY.md` at the start of project work.
- Update `MEMORY.md` after project setup and after meaningful work when durable context changes.
- When creating or closing a Linear issue, perform a memory touch: update `MEMORY.md` if the issue adds or changes durable project knowledge such as decisions, constraints, architecture, links, shipped outcomes, or handoff context.
- Do not turn `MEMORY.md` into an issue log. If a Linear issue create/close has no durable project knowledge, add no memory entry and say that no memory update was needed.
- Keep each memory entry to one or two sentences.

## Verification

- `[COMMAND OR MANUAL CHECK]`

## PR Standard

Every PR should explain:

- What changed
- Why
- Linear issue
- Acceptance criteria checked
- Risk
- How to test
- What was intentionally not done
- Agent involvement
- Follow-up issues created

## Editorial Rules

Follow my voice principles in `<PROJECTS_ROOT>/resources/voice-principles.md`. Add project-specific writing rules only when they are distinct from the root rules.
