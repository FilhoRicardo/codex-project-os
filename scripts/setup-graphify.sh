#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage: setup-graphify.sh [project-dir] [--build] [--obsidian] [--obsidian-dir DIR] [--hooks]

Installs lean project-scoped Graphify support for a managed code project.

Options:
  --build             Build or refresh the code graph with `graphify update .`
  --obsidian          Export graph notes to the Projects vault, or graphify-out/obsidian/
  --obsidian-dir DIR  Export graph notes to DIR; implies --obsidian
  --hooks             Install Graphify post-commit/post-checkout git hooks
EOF
}

PROJECT_DIR="."
BUILD=false
OBSIDIAN=false
OBSIDIAN_DIR=""
HOOKS=false

while [[ $# -gt 0 ]]; do
  case "$1" in
    --build)
      BUILD=true
      shift
      ;;
    --obsidian)
      OBSIDIAN=true
      shift
      ;;
    --obsidian-dir)
      if [[ $# -lt 2 ]]; then
        echo "--obsidian-dir requires a directory path." >&2
        usage
        exit 1
      fi
      OBSIDIAN=true
      OBSIDIAN_DIR="$2"
      shift 2
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
PROJECT_ABS="$(pwd)"

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
  graphify update .
fi

if [[ "$OBSIDIAN" == "true" ]]; then
  if [[ ! -f graphify-out/graph.json ]]; then
    echo "Obsidian export requires graphify-out/graph.json. Re-run with --build --obsidian." >&2
    exit 1
  fi

  VAULT_ROOT=""
  SEARCH_DIR="$PROJECT_ABS"
  while [[ "$SEARCH_DIR" != "/" ]]; do
    if [[ -d "$SEARCH_DIR/.obsidian" ]]; then
      VAULT_ROOT="$SEARCH_DIR"
      break
    fi
    SEARCH_DIR="$(dirname "$SEARCH_DIR")"
  done

  if [[ -n "$VAULT_ROOT" ]]; then
    echo "Obsidian vault detected at $VAULT_ROOT"
    if [[ -z "$OBSIDIAN_DIR" ]]; then
      OBSIDIAN_DIR="$VAULT_ROOT/graphify/$(basename "$PROJECT_ABS")"
    fi
  else
    echo "No parent .obsidian folder detected; exporting a standalone Obsidian graph folder."
    if [[ -z "$OBSIDIAN_DIR" ]]; then
      OBSIDIAN_DIR="graphify-out/obsidian"
    fi
  fi

  graphify export obsidian --dir "$OBSIDIAN_DIR"
fi

if [[ "$HOOKS" == "true" ]]; then
  graphify hook install
fi

echo "Graphify setup complete in $(pwd)"
echo "Next: inspect git status before committing graphify files."
