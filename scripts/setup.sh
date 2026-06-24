#!/usr/bin/env bash
# Codex Project OS — one-shot setup.
# Installs the two skills for Codex CLI and Claude Code, and registers codebase-memory-mcp.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

install_skills() {
  local dest="$1"
  [ -z "$dest" ] && return 0
  mkdir -p "$dest"
  for skill in project-new plan-review; do
    rm -rf "${dest:?}/$skill"
    cp -R "$REPO_DIR/skills/$skill" "$dest/$skill"
    echo "  installed $skill -> $dest/$skill"
  done
}

echo "Installing skills..."
install_skills "$HOME/.codex/skills"
install_skills "$HOME/.claude/skills"

echo
echo "Registering codebase-memory-mcp (code indexing)..."
if command -v codebase-memory-mcp >/dev/null 2>&1; then
  echo "  codebase-memory-mcp already on PATH. In a project, say: \"Index this project\"."
else
  echo "  Not installed. To enable 120x-cheaper code queries, run:"
  echo "    curl -fsSL https://raw.githubusercontent.com/DeusData/codebase-memory-mcp/main/install.sh | bash"
  echo "  Then restart your agent and say \"Index this project\" inside a repo."
fi

echo
echo "Done. Next:"
echo "  1. cd into your Projects root (or create one with the projects-root template)."
echo "  2. Open Codex or Claude Code and run the project-new skill."
