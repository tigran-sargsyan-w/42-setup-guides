# 11 — Bluetooth

A short, practical guide for using the helper Bluetooth script included in this repository's `scripts/` directory.

## Purpose
- Quickly enable Bluetooth, run a short scan (about 10 seconds) and show discovered devices.
- The helper script also restarts audio services when needed and applies simple filtering to hide other computers from the results.

Important: the script can enable Bluetooth but it does not automatically disable Airplane Mode — if Airplane Mode is on, turn it off manually before running the script.

## Requirements
- Python 3.8+ (or a compatible Python 3.x)
- Two small Python packages: `yaspin` and `InquirerPy`

Install the dependencies with pip:

```bash
pip install yaspin InquirerPy
```

## Where the script is
The script is located in the repository `scripts/blue42` directory. 

## Quick run
Run the script directly:

```bash
./blue42
```

Behavior on run:
- The script scans for Bluetooth devices for ~10 seconds, then prints the results and may present interactive choices using InquirerPy.
- It restarts or refreshes audio services if needed so Bluetooth audio devices are recognized correctly.
- It filters the device list to hide unrelated or other computers.

## Make it a short command (install or alias)

Option A — copy to `/usr/local/bin` (system-wide command, requires sudo):

```bash
chmod +x /scripts/blue42
cp 42-setup-guides/scripts/blue42 /usr/local/bin/pair
# now you can run `pair`
```

Option B — add an alias to your shell (per-user, works without sudo):

```bash
# zsh example — append an alias to ~/.zshrc
echo "alias pair='python3 $HOME/42-setup-guides/scripts/blue42'" >> ~/.zshrc
source ~/.zshrc
# then run `pair`
```

Use whichever fits your setup. If your repo is not cloned at `$HOME/42-setup-guides`, change the path accordingly.

## Troubleshooting
- Nothing found during scan: ensure the Bluetooth adapter is powered on (check any physical switch) and not soft-blocked.
- Script fails while restarting services: inspect the script output and try restarting the services manually (examples below).
- Interactive UI not rendering correctly: check your terminal emulator supports VT100/ANSI escapes and that font/locale settings are OK.

Example manual commands you may need (system-dependent):

```bash
# PulseAudio (if used)
systemctl --user restart pulseaudio || pulseaudio -k && pulseaudio --start

# PipeWire
systemctl --user restart pipewire pipewire-pulse

# BlueZ (bluetoothd) — may require sudo
sudo systemctl restart bluetooth
```

## Notes and possible extensions
- The script deliberately does not turn off Airplane Mode — toggling Airplane Mode programmatically is platform-specific and usually requires extra privileges or user confirmation.
