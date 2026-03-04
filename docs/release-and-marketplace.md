# Release and Marketplace Guidance

## Release Process

1. Run tests:
   - `./tests/run-worai.sh`
   - `./tests/install-worai.sh`
   - `./tests/install-playwright.sh`
   - `./tests/resolve-cache-key.sh`
2. Push a semantic version tag (example `v6.0.0`) to GitHub.
3. Workflow `.github/workflows/release.yml` runs automatically and will:
   - validate tag format (`vMAJOR.MINOR.PATCH`)
   - force-update major alias tag `v<major>` to the same commit (for example `v6`)
   - force-update minor alias tag `v<major>.<minor>` to the same commit (for example `v6.5`)
   - create a GitHub Release with generated notes
4. Marketplace publication remains a manual UI step in GitHub Release edit page.

## Consumer Pinning

For best security, consumers should pin actions by full commit SHA. Example:

```yaml
- uses: wordlift/graph-sync@<full-commit-sha>
```

If a tag is used, prefer managed alias tags maintained as aliases to immutable release commits:

- major alias (for example `@v6`) for latest in a major line
- minor alias (for example `@v6.5`) for latest patch in a minor line

## Marketplace Readiness Checklist

- Public repository with an `action.yml` at repository root.
- Clear `name`, `description`, `author`, `branding` metadata.
- Versioned releases and stable alias tags (major and minor).
- README usage with pinned dependencies and input descriptions.
- Automated tests in CI.

## Marketplace Publication Automation Limit

- Full Marketplace publication is not exposed by a public GitHub API endpoint.
- The workflow automates release creation and tag management, then prints a step summary with the release URL and manual Marketplace checklist.

## Versioning Policy

- See `VERSIONING.md` for the lockstep major strategy between this action and `worai`.
