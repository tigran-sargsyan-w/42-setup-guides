# 🧭 42 Setup Guides — Starter Repo

**Curated, battle-tested guides for configuring dev environments at 42 (Linux/WSL/macOS, Vim/Neovim, VS Code, Norminette, Git/SSH, Exam Shell, etc.).**  
Designed for fast onboarding, reproducibility, and clarity. Made by students, for students.

> Maintainer: _Tigran_  
> Campus: 42 Lyon (works for other campuses too)

## 📚 Contents
- `docs/00-overview.md` — What’s inside & how to use these guides
- `docs/01-ssh-and-git.md` — SSH keys, Git config, GitHub/42 Intra, GPG (optional)
- `docs/02-vscode-setup.md` — Extensions, C/C++ debugging, Norminette integration
- `docs/03-vim-neovim.md` — Minimal, fast, norm-friendly configs
- `docs/04-norminette.md` — Install & run everywhere (Python venv/pipx)
- `docs/05-examshell-wsl.md` — Exam Shell on WSL/WSL2 & Linux
- `docs/06-docker-devcontainers.md` — Reproducible environments (Dev Containers)
- `docs/07-wsl-ubuntu.md` — WSL2 quickstart (Windows 10/11)
- `docs/08-linux-essentials.md` — Shell, packages, permissions, locales
- `docs/09-network-and-proxy.md` — Proxy, certificate stores, apt/pip/git behind proxy
- `docs/10-makefile-style.md` — Clean Makefile style (with emoji & comments 😉)

Plus:
- `scripts/` — Automation snippets (installers, bootstrap)
- `.editorconfig` — Consistent code style across editors
- `.gitignore`, `LICENSE`, `CONTRIBUTING.md`, `CODE_OF_CONDUCT.md`

## 🚀 Quick start
```bash
git clone <your-repo-url> 42-setup-guides
cd 42-setup-guides
# Start with SSH + Git
bash scripts/setup_git.sh
# Then Norminette
bash scripts/install_norminette.sh
```

## 🧩 Philosophy
- **Minimal**: only what helps you pass projects & move fast
- **Reproducible**: scripts > manual steps
- **Portable**: Linux, WSL2, macOS
- **Idempotent**: safe to re-run

## 🛠️ Contributing
See [CONTRIBUTING.md](CONTRIBUTING.md). PRs welcome — tiny fixes matter.

## 📄 License
MIT — see [LICENSE](LICENSE).
