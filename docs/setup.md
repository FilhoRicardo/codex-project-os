# Setup

## 1. Install the skills

```bash
git clone https://github.com/FilhoRicardo/codex-project-os.git
cd codex-project-os
./scripts/setup.sh
```

This copies `project-new` and `plan-review` into `~/.codex/skills/` and `~/.claude/skills/`.

Claude Code users can instead install as a plugin:

```text
/plugin marketplace add FilhoRicardo/codex-project-os
/plugin install codex-project-os@codex-project-os
```

## 2. Install code indexing (recommended)

```bash
curl -fsSL https://raw.githubusercontent.com/DeusData/codebase-memory-mcp/main/install.sh | bash
```

It auto-detects Codex CLI and Claude Code and wires up the MCP entry. Restart your agent.

## 3. Create a Projects root (optional)

Copy `templates/projects-root/` into a new workspace folder, or just run `project-new` from any folder you want to manage.

## 4. Start

Open Codex or Claude Code and run the `project-new` skill: "Start a managed project for <idea>."
