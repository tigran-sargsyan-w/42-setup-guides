# 05 — Exam Shell (WSL2/Linux)

> Works offline. Use a clean user directory.

## Install (WSL2/Ubuntu without sudo)
```bash
mkdir -p ~/bin && cd ~/bin
# Place your `examshell` binaries or AppImage here (provided by school)
chmod +x examshell*
```

## Usage
- Launch `examshell` from terminal
- Ensure your `$HOME` has enough space
- Disable auto-formatters during exam
- Test locally with `bash -n` and `gcc -Wall -Wextra -Werror`

> [Campus-note: 42 Lyon] If you have specific proxy or certificate constraints on campus, add them here.
