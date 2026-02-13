# Release and Marketplace Guidance

## Release Process

1. Run tests:
   - `./tests/run-worai.sh`
   - `./tests/install-worai.sh`
2. Push a semantic version tag (example `v1.2.3`) to GitHub.
3. Workflow `.github/workflows/release.yml` runs automatically and will:
   - validate tag format (`vMAJOR.MINOR.PATCH`)
   - update major alias tag `v1` to the same commit
   - create a GitHub Release with generated notes

## Consumer Pinning

For best security, consumers should pin actions by full commit SHA. Example:

```yaml
- uses: wordlift/worai-github-action@<full-commit-sha>
```

If a tag is used, prefer a stable major tag (for example `@v1`) maintained as an alias to immutable release commits.

## Marketplace Readiness Checklist

- Public repository with an `action.yml` at repository root.
- Clear `name`, `description`, `author`, `branding` metadata.
- Versioned releases and stable major tags (`v1`, `v2`, ...).
- README usage with pinned dependencies and input descriptions.
- Automated tests in CI.
