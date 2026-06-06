# Sanitize Before Publishing

Before publishing a scaffold repo, check for:

- Personal local paths
- Private project names
- Private Linear URLs
- Private GitHub repositories
- Personal memory entries
- Secrets and environment files

Useful check:

```bash
rg -n "/Users/|linear.app|PRIVATE|SECRET|TOKEN|PASSWORD|PROJECTS.md registry|Root Memory" .
```

The public repo should contain reusable patterns, not your live workspace.
