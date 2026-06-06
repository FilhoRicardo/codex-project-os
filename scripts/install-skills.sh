#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKILLS_ROOT="${CODEX_HOME:-$HOME/.codex}/skills"

mkdir -p "$SKILLS_ROOT"

rm -rf "$SKILLS_ROOT/project-initiator" "$SKILLS_ROOT/claude-devil-review"
cp -R "$REPO_ROOT/skills/project-initiator" "$SKILLS_ROOT/project-initiator"
cp -R "$REPO_ROOT/skills/claude-devil-review" "$SKILLS_ROOT/claude-devil-review"

echo "Installed skills to $SKILLS_ROOT"
