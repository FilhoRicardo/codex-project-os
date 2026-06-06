---
name: project-initiator
description: Initiate, scaffold, or repair Codex-managed projects in a Projects root workspace. Use when the user asks to create a new project, start a managed Codex project, set up project folders, add AGENTS.md/CLAUDE.md/MEMORY.md, link or check GitHub and Linear, create a first Linear issue, update PROJECTS.md, or make agents aware of a project's GitHub/Linear workflow.
---

# Project Initiator

Use this skill to turn a project idea into a consistent workspace entry with local instructions, memory, resources, and GitHub/Linear awareness.

Codex is the executor. Claude is the devil's advocate for managed project plans.

## Preflight

1. Work from `<PROJECTS_ROOT>`.
2. Read root `MEMORY.md`, root `AGENTS.md`, root `CLAUDE.md`, and `PROJECTS.md`.
3. Read `references/workspace.md` for exact paths and update checklist.
4. State assumptions and ask only for missing essentials. Default to a managed project unless the user says it is a quick local experiment.

## Essential Inputs

Ask for missing values before creating files when they cannot be inferred safely:

- Project name and folder slug.
- Intended outcome in one sentence.
- Template type: `codex-managed` by default, `codex-basic` for local experiments.
- GitHub preference: create repo, link existing repo, or mark `Create/link required`.
- Linear preference: create project/issue, link existing project/issue, or mark `Create/link required`.

## Stage 0: Clarify And Challenge

For managed projects, use `claude-devil-review` when available before implementation or detailed issue creation:

1. Codex interviews the user only for missing essentials.
2. Codex writes `PLAN.md` with goal, acceptance criteria, approach, risks, non-goals, verification, and GitHub/Linear/memory impact.
3. Codex asks Claude CLI to challenge the plan as devil's advocate for up to five rounds.
4. Codex revises the plan or rejects weak critique with reasons in `PLAN-REVIEW-LOG.md`.
5. Codex asks the user for final signoff before creating implementation issues or writing code.

Skip this stage only when the user explicitly says `local-only`, `basic`, or `skip Claude review`.

## Creation Workflow

1. Confirm the project folder does not already exist under `active/`.
2. Copy the chosen template from `resources/project-templates/` into `active/[folder]`.
3. For managed projects, keep both `AGENTS.md` and `CLAUDE.md`: `AGENTS.md` is Codex executor guidance, `CLAUDE.md` is Claude critic-only guidance.
4. Replace placeholders in `AGENTS.md`, `CLAUDE.md`, and `PLAN.md` with project name, folder, routing trigger, source-of-truth links, and verification command.
5. Initialize `MEMORY.md` with project-specific headings only: Contacts, Source Links, Key Decisions, and Durable Outcomes. Do not copy root memory.
6. Keep or create `resources/` inside the project folder.
7. Keep `PLAN.md` and `PLAN-REVIEW-LOG.md` for managed projects, even before the first review.
8. Update `PROJECTS.md` with folder, instruction files, GitHub, Linear, and status.
9. Update the Routing Map in root `AGENTS.md`.
10. If requested and tools are available, create/link the GitHub repo and Linear project/first issue. If not available, write `Create/link required`; do not invent URLs.
11. Update project `MEMORY.md` with durable setup facts: GitHub repo, Linear project, first issue, key decisions, and constraints.
12. Verify the scaffold by listing the created files and checking `PROJECTS.md` plus both Routing Maps.

## Repair Workflow

Use this when a project already exists but is missing scaffold pieces:

1. Inspect the project folder, git remote, local instructions, memory, and resources.
2. Add only missing scaffold files or missing GitHub/Linear metadata.
3. Preserve project-specific instructions; do not replace them with a generic template unless the user asks.
4. Update `PROJECTS.md` and root Routing Maps.
5. Call out remaining missing GitHub/Linear links.

## Linear And GitHub Rules

- Always keep four fields visible: project folder, GitHub repo, Linear project, Linear issue.
- For non-trivial code work, a managed project should have a Linear issue before implementation.
- GitHub is the code and PR source of truth.
- Linear is the roadmap, issue scope, and acceptance criteria source of truth.
- If a link is missing, ask whether to create or link it unless the user explicitly says the work is local-only.

## Memory Rules

- Read project `MEMORY.md` at the start of project work.
- Update project `MEMORY.md` after project setup and after meaningful work when durable context changes.
- When creating or closing a Linear issue, perform a memory touch: update project `MEMORY.md` if the issue adds or changes durable project knowledge such as decisions, constraints, architecture, links, shipped outcomes, or handoff context.
- Do not turn `MEMORY.md` into an issue log. If a Linear issue create/close has no durable project knowledge, add no memory entry and say that no memory update was needed.
- Keep each memory entry to one or two sentences.

## Done Criteria

Finish only when:

- The project folder exists or the repair is complete.
- Managed projects have `AGENTS.md`, `CLAUDE.md`, `MEMORY.md`, `PLAN.md`, `PLAN-REVIEW-LOG.md`, and `resources/`.
- Basic projects have `AGENTS.md`, `MEMORY.md`, and `resources/`.
- Managed projects have either completed `claude-devil-review` or the final response says why it was skipped.
- `PROJECTS.md` has a current row.
- Root `AGENTS.md` Routing Map includes the project.
- Missing GitHub/Linear links are either filled or explicitly marked `Create/link required`.
- Project `MEMORY.md` has been updated, or the final response says why no durable memory update was needed.
