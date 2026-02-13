#!/usr/bin/env bash
set -euo pipefail

profile="${INPUT_PROFILE:-}"
config_path="${INPUT_CONFIG_PATH:-}"
debug="${INPUT_DEBUG:-false}"
working_directory="${INPUT_WORKING_DIRECTORY:-.}"
debug_lower="$(printf '%s' "$debug" | tr '[:upper:]' '[:lower:]')"

if [[ -z "$profile" ]]; then
  echo "error: input 'profile' is required" >&2
  exit 1
fi

if [[ ! -d "$working_directory" ]]; then
  echo "error: working directory does not exist: $working_directory" >&2
  exit 1
fi

if ! command -v worai >/dev/null 2>&1; then
  echo "error: worai not found in PATH" >&2
  exit 1
fi

cmd=("worai")

if [[ -n "$config_path" ]]; then
  cmd+=("--config" "$config_path")
fi

cmd+=("graph" "sync" "--profile" "$profile")

case "$debug_lower" in
  true|1|yes)
    cmd+=("--debug")
    ;;
  false|0|no|'')
    ;;
  *)
    echo "error: input 'debug' must be true or false" >&2
    exit 1
    ;;
esac

cd "$working_directory"
printf 'Running:'
printf ' %q' "${cmd[@]}"
printf '\n'

"${cmd[@]}"
