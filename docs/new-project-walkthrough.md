# What happens when a new project is created

This walks through every step the agent takes when you start a new managed project under scaffold **v3**. Run it by invoking the `project-new` skill — e.g. "Start a managed project for &lt;idea&gt;".

## 0. Announcement

The agent's first line is exactly:

```
lets build it Ricardo - we are using v3 now
```

If you don't see it, something is loading the old path — stop and check which skills are installed.

## 1. Preflight

The agent reads the Projects-root context before doing anything:

- Root `MEMORY.md`, root `AGENTS.md`, and `PROJECTS.md`.
- States its assumptions and asks **only** for missing essentials: project name/slug, one-sentence outcome, and template (`managed` by default, `basic` for a throwaway experiment).

Defaults for managed projects — only questioned if wrong: **private** GitHub repo, a Linear **project + first issue**.

## 2. The planning gate (the one place Codex ↔ Claude loop runs)

For managed projects, before any code:

1. **Grill the user** (mattpocock `grilling` pattern). The agent interviews you **one question at a time**, recommending an answer for each, walking the design tree and resolving dependencies. Questions answerable from the codebase are explored, not asked.
2. The agent writes `PLAN.md` (Goal, Acceptance Criteria, Approach, Key Decisions, Risks, Out of Scope, Verification, Linear/Memory impact).
3. **Claude critique** — `plan-review` runs Claude once, read-only, as devil's advocate. Its verdict (`CLEAR` / `REVISE`) and critique are appended to `PLAN-REVIEW-LOG.md`.
4. Codex revises the plan, logging what it accepted and rejected (with reasons).
5. **You sign off.** No code starts until you do.

This gate runs **once per plan** — never per feature, issue, or routine decision. That bound is the whole reason v3 is cheap to run.

Skip the gate only if you say `basic`, `local-only`, or `skip review`.

## 3. Scaffold the folder

`templates/managed` (or `templates/basic`) is copied into `active/<slug>/` and placeholders are filled:

```
active/<slug>/
  AGENTS.md            Codex execution guidance for this project
  CLAUDE.md            Claude critic contract (planning-gate only)
  PLAN.md              the signed-off plan
  PLAN-REVIEW-LOG.md   the grilling + critique record
  MEMORY.md            durable decisions only (starts near-empty)
  .gitignore           secrets/logs/index-cache ignored
  resources/           project-specific reference files
```

`basic` projects get only `AGENTS.md`, `MEMORY.md`, and `resources/`.

## 4. Link Linear + GitHub

Four fields are made visible and kept current:

| Field | Source of truth |
|-------|-----------------|
| Project folder | `active/<slug>/` |
| GitHub repo | branches, PRs, shipped code (private by default) |
| Linear project | roadmap, scope, status |
| Linear issue | acceptance criteria for the current unit of work |

If a tool is unavailable, the agent writes `Create/link required` and names the blocker — it never invents a URL.

## 5. Register code indexing

For managed code projects, after the repo exists and `.gitignore` is safe, the agent registers **codebase-memory-mcp** and you say "Index this project". From then on agents query the graph (`search_graph`, `trace_path`, `get_architecture`, `query_graph`, `detect_changes`) before broad file reading — ~120× cheaper than grep/read sweeps. (Requires the one-time install; see `docs/memory-and-indexing.md`.)

## 6. Register the project

- A row is added to `PROJECTS.md`.
- The routing map in the root `AGENTS.md` gets the project so future sessions load it.

## 7. Memory touch

The agent writes **durable setup facts only** to the project `MEMORY.md` (repo, Linear project, key decisions). Routine work and re-indexing are not memory events.

## 8. Build

Implementation proceeds from Linear issues. Three lifecycle skills are available on demand (they only load when their trigger fires):

- `spec-driven-development` — when a feature needs a spec first.
- `incremental-implementation` — when a change spans more than one file.
- `shipping-and-launch` — when preparing a production launch.

No further grilling happens unless you explicitly ask for a major re-plan.

## Done criteria

- `active/<slug>/` exists with its scaffold files.
- GitHub + Linear links filled, or explicitly marked `Create/link required`.
- `PROJECTS.md` and the root routing map include the project.
- Project `MEMORY.md` has durable setup facts, or the agent states why none were needed.
