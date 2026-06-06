# Plan: Publish Codex Project OS

## Goal

Publish a sanitized public framework repo that other people can copy to run AI-assisted projects with Codex as executor and Claude as critic.

## Acceptance Criteria

- Public GitHub repository exists at `FilhoRicardo/codex-project-os`.
- Repo includes templates, skills, docs, examples, scripts, and MIT license.
- No private project registry, personal memory, local private paths, or Linear URLs are published.
- Skills validate with Codex skill validation.
- Repo is marked as a GitHub template when supported.

## Approach

Create a clean active project, copy the generic scaffold pieces, sanitize local paths, write public docs, validate, create GitHub repo, push, and mark as template.

## Key Decisions And Tradeoffs

- Publish as a template repo rather than pushing the real Projects folder.
- Keep private Linear management local and out of the public repo.
- Include skills as copyable Codex skill folders.

## Risks And Unknowns

- Private strings could leak if copied files are not sanitized.
- Claude CLI review may be unavailable due provider session limits.
- GitHub template setting may require CLI support.

## Out Of Scope

- Publishing active project code.
- Publishing private `PROJECTS.md` or root `MEMORY.md`.
- Copying third-party repository content.

## Verification

- Validate both skills.
- Grep for private strings.
- Inspect git diff before commit.
- Verify GitHub repo after push.

## GitHub, Linear, And Memory Impact

- Create public GitHub repo.
- Create maintainer Linear project privately.
- Update local root registry and memory.
