# 08 — Linux essentials for 42

## Packages (if sudo available)
```bash
sudo apt update
sudo apt install build-essential gdb make valgrind clang-format cmake pkg-config
```

## Shell basics
- `man <cmd>` — read manuals
- `apropos <word>` — search commands
- `which <cmd>` — where command lives

## Permissions
```bash
chmod +x script.sh
chmod 644 file.c
```

## Locales (fix weird characters)
```bash
# Debian/Ubuntu
# sudo dpkg-reconfigure locales
```
