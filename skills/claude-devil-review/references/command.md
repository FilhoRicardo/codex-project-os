# Claude CLI Command Reference

Verified locally on `claude`, Claude Code `2.1.159`.

Before the review loop, check auth:

```bash
claude -p --tools "" --permission-mode plan 'Return exactly: OK'
```

If this returns `401 Invalid authentication credentials`, ask the user to run `claude login` or configure Claude credentials before continuing.

Use no-tools print mode for devil's-advocate review:

```bash
claude -p --tools "" --permission-mode plan "$(cat /tmp/claude-devil-prompt.txt)" > /tmp/claude-devil-verdict.txt
```

Why:

- `-p` prints one response and exits.
- `--tools ""` disables tools, so Claude cannot edit files or run commands.
- `--permission-mode plan` keeps the session in planning posture.

If this command fails, stop and tell the user. Do not silently skip the devil's-advocate step.
