#!/usr/bin/env bash
set -euo pipefail

echo "==> Generating SSH key (ed25519) if missing..."
if [[ ! -f "$HOME/.ssh/id_ed25519" ]]; then
  ssh-keygen -t ed25519 -C "${USER}@$(hostname)-42" -f "$HOME/.ssh/id_ed25519" -N ""
fi

eval "$(ssh-agent -s)" >/dev/null
ssh-add "$HOME/.ssh/id_ed25519" >/dev/null || true

echo "==> Basic git config"
git config --global init.defaultBranch main
git config --global pull.rebase false
git config --global core.autocrlf input
git config --global core.editor "vim"

echo "==> Done. Add this key to GitHub and/or 42 Intra:"
echo
cat "$HOME/.ssh/id_ed25519.pub"
echo
echo "==> Copy the line above and paste it into your account's SSH keys."
