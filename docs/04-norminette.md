# 04 — Norminette (portable install)

## TL;DR (no sudo, user env)
```bash
# Prefer pipx (isolated)
python3 -m pip install --user pipx
python3 -m pipx ensurepath
pipx install norminette

# or venv:
python3 -m venv ~/.venv/norm
~/.venv/norm/bin/pip install norminette
echo 'export PATH="$HOME/.venv/norm/bin:$PATH"' >> ~/.profile
```

## Usage
```bash
norminette
norminette src/*.c include/*.h
```

If `command not found`, ensure your **PATH** is updated and re-login.
