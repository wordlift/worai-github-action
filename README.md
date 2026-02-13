# worai GitHub Action

GitHub Action to install `worai` and run:

- `worai graph sync --profile <name> [--debug]`
- `worai --config <path> graph sync --profile <name> [--debug]`

## Requirements

- Python must be available on the runner (for installing `worai`).
- `profile` is required and must exist in the selected `worai` config.

## Inputs

- `profile` (required): profile name to pass with `--profile`.
- `config_path` (optional): if set, action passes root `--config <path>`.
- `debug` (optional, default `false`): when `true`, appends `--debug`.
- `working_directory` (optional, default `.`): where command executes.
- `worai_version` (optional, default `1.14.0`): pinned `worai` version to install.

## Behavior

- If `config_path` is set, command is:
  - `worai --config <path> graph sync --profile <name> [--debug]`
- If `config_path` is not set, command is:
  - `worai graph sync --profile <name> [--debug]`

Without root `--config`, standard `worai` config discovery applies:

- `WORAI_CONFIG`
- `./worai.toml`
- `~/.config/worai/config.toml`
- `~/.worai.toml`

## Notes

- Supported input sources are managed by `worai` config: `urls`, `sitemap_url` (+ optional `sitemap_url_pattern`), and Google Sheets (`sheets_url` + `sheets_name` + `sheets_service_account`).
- `sheets_service_account` accepts inline JSON object content or a file path.
- For Google Sheets source, `sheets_service_account` is required and the command fails when:
  - value is missing or empty
  - value is neither valid JSON object content nor an existing file path
  - value is valid JSON but not an object
- `google_search_console` can be global or profile-level in `worai.toml`; profile value overrides global value; default is `false` when unset; maps to SDK setting `GOOGLE_SEARCH_CONSOLE`.
- The command fails when selected profile does not define `api_key`.

## Usage

```yaml
name: Sync graph
on:
  workflow_dispatch:

jobs:
  sync:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@11bd71901bbe5b1630ceea73d27597364c9af683 # v4.2.2
      - uses: actions/setup-python@a26af69be951a213d495a4c3e4e4022e16d87065 # v5.6.0
        with:
          python-version: '3.11'
      - uses: ./. # or owner/repo@tag
        with:
          profile: production
          config_path: ./worai.toml
          debug: false
          worai_version: 1.14.0
```

## Release and Pinning

- Publish immutable releases and move major tags (`v1`, `v2`) only by creating new immutable release tags.
- Consumers should pin this action to a full commit SHA for maximum integrity.
- If using tags, prefer stable major tags (`@v1`) and keep them mapped to immutable release commits.
- This repository includes automated release workflow `.github/workflows/release.yml` triggered by pushing tags like `v1.2.3`.

## Development

Run tests locally:

```bash
./tests/run-worai.sh
./tests/install-worai.sh
```
