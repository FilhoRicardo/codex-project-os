#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <projects-root>"
  exit 1
fi

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PROJECTS_ROOT="$1"

mkdir -p "$PROJECTS_ROOT/active" "$PROJECTS_ROOT/archive" "$PROJECTS_ROOT/resources/project-templates" "$PROJECTS_ROOT/scripts"

cp "$REPO_ROOT/templates/projects-root/AGENTS.md" "$PROJECTS_ROOT/AGENTS.md"
cp "$REPO_ROOT/templates/projects-root/CLAUDE.md" "$PROJECTS_ROOT/CLAUDE.md"
cp "$REPO_ROOT/templates/projects-root/MEMORY.md" "$PROJECTS_ROOT/MEMORY.md"
cp "$REPO_ROOT/templates/projects-root/PROJECTS.md" "$PROJECTS_ROOT/PROJECTS.md"
cp "$REPO_ROOT/scripts/setup-graphify.sh" "$PROJECTS_ROOT/scripts/setup-graphify.sh"

rm -rf "$PROJECTS_ROOT/resources/project-templates/codex-basic" "$PROJECTS_ROOT/resources/project-templates/codex-managed"
cp -R "$REPO_ROOT/templates/codex-basic" "$PROJECTS_ROOT/resources/project-templates/codex-basic"
cp -R "$REPO_ROOT/templates/codex-managed" "$PROJECTS_ROOT/resources/project-templates/codex-managed"

echo "Bootstrapped Projects root at $PROJECTS_ROOT"
