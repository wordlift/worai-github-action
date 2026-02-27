# Agent Guide

## Verification

- Run `./tests/run-worai.sh`, `./tests/install-worai.sh`, `./tests/install-playwright.sh`, and `./tests/resolve-cache-key.sh` after any logic change.
- Add or update tests when behavior changes.

## Documentation Sync

- Keep `README.md`, `VERSIONING.md`, `docs/`, `specs/`, `INDEX.md`, and `TODO.md` aligned with implementation.

## Action Scope

This repository provides a GitHub Action wrapper around:

- `worai --profile <name> graph sync run [--debug]`
- `worai --config <path> --profile <name> graph sync run [--debug]`
- installation of pinned `worai` versions via `worai_version`
- optional installation of pinned Python Playwright + browser binaries
- optional cache restore/save for pip and Playwright browser binaries
