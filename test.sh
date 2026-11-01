#!/bin/sh
set -eu

case "$0" in
    */*) SCRIPT_DIR=${0%/*} ;;
    *) SCRIPT_DIR=. ;;
esac
SCRIPT_DIR=$(CDPATH= cd -- "$SCRIPT_DIR" && pwd)

if [ -x "$SCRIPT_DIR/.venv/bin/python" ]; then
    PYTHON="$SCRIPT_DIR/.venv/bin/python"
else
    for candidate in "$HOME"/.local/share/uv/python/*/bin/python; do
        if [ -x "$candidate" ]; then
            PYTHON="$candidate"
            break
        fi
    done
fi

if [ -z "${PYTHON:-}" ] && command -v python3 >/dev/null 2>&1; then
    PYTHON=python3
fi

if [ -z "${PYTHON:-}" ] && command -v python >/dev/null 2>&1; then
    PYTHON=python
fi

if [ -z "${PYTHON:-}" ]; then
    printf '%s\n' 'Python was not found. Install Python or create a .venv in this folder.' >&2
    exit 1
fi

cd "$SCRIPT_DIR"
PYTHONDONTWRITEBYTECODE=1 "$PYTHON" -c 'from test import greet; print(greet())'
exec "$PYTHON" test.py
