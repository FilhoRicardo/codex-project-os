# Setup

## 1. Install Skills

From this repository:

```bash
./scripts/install-skills.sh
```

This copies:

- `skills/project-initiator`
- `skills/claude-devil-review`

into:

```text
${CODEX_HOME:-$HOME/.codex}/skills
```

## 2. Create A Projects Root

```bash
./scripts/bootstrap-projects-root.sh ~/Documents/Projects
```

This creates:

```text
Projects/
  AGENTS.md
  CLAUDE.md
  MEMORY.md
  PROJECTS.md
  scripts/setup-graphify.sh
  active/
  archive/
  resources/project-templates/
```

## 3. Authenticate Tools

For GitHub:

```bash
gh auth login
```

For Claude CLI:

```bash
claude login
```

For Linear, connect the Linear app or configure the Linear tooling used by your agent environment.

## 4. Start A Project

Open Codex in your Projects root and say:

```text
Initiate a managed project for [idea]
```

By default, a managed project creates a private GitHub repo, Linear project, and first Linear issue. You can opt out in the prompt.

## 5. Add Graphify To A Managed Code Project

After the project has a repo and safe ignore rules:

```bash
./scripts/setup-graphify.sh active/[project] --build
```

Use `--hooks` only when you want Graphify to update after commits.
