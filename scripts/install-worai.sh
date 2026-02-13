#!/usr/bin/env bash
set -euo pipefail

worai_version="${INPUT_WORAI_VERSION:-}"

if [[ -z "$worai_version" ]]; then
  echo "error: input 'worai_version' is required" >&2
  exit 1
fi

if [[ "$worai_version" =~ [[:space:]] ]]; then
  echo "error: input 'worai_version' must not contain whitespace" >&2
  exit 1
fi

python_cmd=""
if command -v python3 >/dev/null 2>&1; then
  python_cmd="python3"
elif command -v python >/dev/null 2>&1; then
  python_cmd="python"
else
  echo "error: Python is required but neither 'python3' nor 'python' was found in PATH" >&2
  exit 1
fi

"$python_cmd" -m pip install --upgrade pip
"$python_cmd" -m pip install "worai==$worai_version"
