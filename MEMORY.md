# Codex Project OS Memory

## Contacts

_None recorded yet._

## Source Links

- GitHub repository: https://github.com/FilhoRicardo/codex-project-os

## Key Decisions

- `AGENTS.md` is Codex executor guidance and `CLAUDE.md` is Claude critic-only guidance.
- Managed projects keep `PLAN.md` and `PLAN-REVIEW-LOG.md` so the plan and critique loop are preserved.
- Managed project initiation creates a private GitHub repo, Linear project, and first Linear issue by default unless the user opts out or links existing records.
- Managed code projects use Graphify as an optional project-map layer after the GitHub repo exists and ignore rules protect secrets and local data.
- Graphify setup supports Obsidian exports in `<Projects root>/graphify/[project]/` and post-commit/post-checkout hooks for managed code projects.
- Aster is now the default visual system for new app/frontend projects created with the scaffold unless an explicit project-specific brand overrides it.

## Durable Outcomes

- Published the first public Codex Project OS template repo and marked it as a GitHub template.
- Created and closed the initial maintainer Linear issue for publishing the framework.
- Updated the framework so templates, examples, docs, and the project-initiator skill default managed projects to GitHub and Linear creation.
- Added lean Graphify infrastructure to the managed project scaffold without vendoring Graphify or running it across existing projects.
- Added Aster branding resources and scaffold rules so new app/frontend projects inherit the same visual language by default.
