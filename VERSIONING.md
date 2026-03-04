# Versioning Policy

This repository uses a lockstep-major versioning strategy with `worai`.

## Rules

1. Action major version matches `worai` major version.
2. The action's default `worai_version` must be a pinned, exact version in the same major line.
3. Action minor and patch releases are allowed without changing `worai` major when:
   - action wrapper behavior changes in a backward-compatible way
   - tests, docs, and release automation improvements are shipped
   - default `worai_version` is bumped within the same major line
4. Any default `worai_version` bump across majors requires a new action major release.
5. Major alias tags (`v6`, `v7`, ...) must always point to the latest immutable release tag in that major line.
6. Minor alias tags (`v6.5`, `v7.2`, ...) must always point to the latest immutable release tag in that minor line.

## Compatibility

- Action `v6` targets `worai` `6.x` by default.
- Users can override `worai_version`, but versions outside the action's major line are best-effort and not guaranteed by this policy.

## Consumer Guidance

- For maximum supply-chain integrity, pin action usage to a full commit SHA.
- For convenience and managed updates, use an alias tag:
  - major alias (for example `@v6`) for latest in a major line
  - minor alias (for example `@v6.5`) for latest patch in a minor line
