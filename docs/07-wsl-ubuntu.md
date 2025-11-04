# 07 — WSL2 Ubuntu quickstart

## Install (Windows 11)
```powershell
wsl --install -d Ubuntu
```
Reboot if prompted.

## Basics
```bash
sudo apt update && sudo apt upgrade   # if you have sudo
sudo apt install build-essential gdb make valgrind
```

## File system tips
- Work **inside** WSL (`/home/<user>/...`), not on `/mnt/c`, to avoid path issues.
