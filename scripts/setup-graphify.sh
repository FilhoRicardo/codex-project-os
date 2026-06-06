#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage: setup-graphify.sh [project-dir] [--build] [--hooks]

Installs lean project-scoped Graphify support for a managed code project.

Options:
  --build   Build the first graph with `graphify .`
  --hooks   Install Graphify git hooks after project setup
EOF
}

PROJECT_DIR="."
BUILD=false
HOOKS=false

while [[ $# -gt 0 ]]; do
  case "$1" in
    --build)
      BUILD=true
      shift
      ;;
    --hooks)
      HOOKS=true
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    -*)
      echo "Unknown option: $1" >&2
      usage
      exit 1
      ;;
    *)
      PROJECT_DIR="$1"
      shift
      ;;
  esac
done

cd "$PROJECT_DIR"

if [[ ! -f AGENTS.md ]]; then
  echo "Run from a project root, or pass one. AGENTS.md was not found." >&2
  exit 1
fi

touch .gitignore

add_ignore() {
  local line="$1"
  if ! grep -qxF "$line" .gitignore; then
    printf '%s\n' "$line" >> .gitignore
  fi
}

add_ignore "graphify-out/cost.json"
add_ignore "graphify-out/cache/"

if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  SENSITIVE_REGEX='(^|/)\.env($|[.])|(^|/).*(secret|service-key|creds|credentials).*$|(^|/).*token.*[.](json|txt|env|key)$|[.](log|out|err)$'
  UNIGNORED="$(git ls-files --others --exclude-standard | grep -E "$SENSITIVE_REGEX" || true)"
  if [[ -n "$UNIGNORED" && "${GRAPHIFY_ALLOW_UNIGNORED_SENSITIVE:-}" != "1" ]]; then
    echo "Refusing to set up Graphify while sensitive-looking unignored files exist:" >&2
    printf '%s\n' "$UNIGNORED" >&2
    echo "Update .gitignore first, or set GRAPHIFY_ALLOW_UNIGNORED_SENSITIVE=1 if these are safe." >&2
    exit 1
  fi
fi

if ! command -v graphify >/dev/null 2>&1; then
  if command -v uv >/dev/null 2>&1; then
    uv tool install --upgrade graphifyy
  elif command -v pipx >/dev/null 2>&1; then
    pipx install graphifyy || pipx upgrade graphifyy
  else
    python3 -m pip install --user graphifyy
  fi
fi

graphify install --project --platform codex

if [[ -f CLAUDE.md ]]; then
  graphify claude install --project
fi

if [[ "$BUILD" == "true" ]]; then
  graphify .
fi

if [[ "$HOOKS" == "true" ]]; then
  graphify hook install
fi

echo "Graphify setup complete in $(pwd)"
echo "Next: inspect git status before committing graphify files."
