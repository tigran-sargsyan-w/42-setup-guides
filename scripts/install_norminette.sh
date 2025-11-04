#!/usr/bin/env bash
set -euo pipefail

PY=${PY:-python3}

echo "==> Installing pipx (user) if missing"
$PY -m pip install --user -q pipx || true
$PY -m pipx ensurepath

echo "==> Installing norminette via pipx"
pipx install --force norminette

echo "==> Verifying"
norminette --version || { echo "norminette not in PATH; re-login your shell."; exit 1; }

echo "==> Done. Usage: norminette <paths>"
