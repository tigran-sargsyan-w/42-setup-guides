# 03 — Keyboard Layouts & Shortcut (GNOME, no sudo) 🧩 

This README explains how to **add a keyboard layout** and **assign a shortcut** to switch layouts on Linux (focus: GNOME). Everything is done **without sudo**, and settings **persist** across logins.

---

## 1) Add a layout via GUI (easiest)

**Settings → Keyboard → Input Sources → “+”**  
Add your language (e.g., **Russian** / **French** / **Armenian**).  
Verify you see, for example: **English (US)** and **Russian**.

> Check current layouts in terminal:
```
gsettings get org.gnome.desktop.input-sources sources
# Example: [('xkb', 'us'), ('xkb', 'ru')]
```

---

## 2) Set a shortcut to switch layouts

GNOME sometimes won’t let you assign a hotkey in the GUI. Do it reliably with `gsettings`:

### Option A — Alt+Shift (recommended)
```
gsettings set org.gnome.desktop.input-sources xkb-options "['grp:alt_shift_toggle']"
```

### Other options
```
# Ctrl+Shift
gsettings set org.gnome.desktop.input-sources xkb-options "['grp:ctrl_shift_toggle']"

# Caps Lock
gsettings set org.gnome.desktop.input-sources xkb-options "['grp:caps_toggle']"

# Reset to GNOME defaults
gsettings reset org.gnome.desktop.input-sources xkb-options
```

### Verify
```
gsettings get org.gnome.desktop.input-sources xkb-options
# Expected: ['grp:alt_shift_toggle']
```

**Note:** These settings are stored in user dconf and **persist** after logout/reboot.

---

## 3) Apply immediately (without relogin, X11)

If you want it to work **right now** (on X11), run:
```
setxkbmap -layout "us,ru" -option "grp:alt_shift_toggle"
```
> This is temporary for the session; permanence comes from step 2 (`gsettings`).

---

## 4) FAQ

- **Will it persist after reboot/login?**  
  Yes. `gsettings` writes to GNOME dconf (per-user).

- **Why doesn’t it work in some WMs/sessions?**  
  If you start **i3/Openbox/bare Xorg** without GNOME, the GNOME Settings Daemon may not apply it.  
  Solution — put this in `~/.xprofile`:
  ```
  setxkbmap -layout "us,ru" -option "grp:alt_shift_toggle"
  ```

- **How to inspect active layouts and options?**
  ```
  setxkbmap -query
  # Example:
  # layout:   us,ru
  # options:  grp:alt_shift_toggle
  ```

---

## 5) Xfce / other environments

### Xfce (no sudo, simple)
Prefer the GUI (**Settings → Keyboard → Layout**). To force-apply on login (X11), add to `~/.xprofile`:
```
setxkbmap -layout "us,ru" -option "grp:alt_shift_toggle"
```
Log out and back in.

### i3 / Openbox / Sway / Hyprland
Add to your session/WM autostart:
```
setxkbmap -layout "us,ru" -option "grp:alt_shift_toggle"
```
For Wayland compositors like **Sway/Hyprland**, configure switching in their native configs; `gsettings` may still work if you run GNOME Wayland.

---

## 6) Quick checklist

- [ ] Added the layout in **Settings → Keyboard → Input Sources**  
- [ ] Set the hotkey via `gsettings` (e.g., Alt+Shift)  
- [ ] Verified with `gsettings get ... xkb-options`  
- [ ] (X11) Applied instantly with `setxkbmap` if needed  
- [ ] For non-GNOME sessions, added `setxkbmap` to `~/.xprofile`

---

## 7) TL;DR

```
# Add the layout in GUI first (Settings → Keyboard → Input Sources)
# Then set the shortcut (Alt+Shift):
gsettings set org.gnome.desktop.input-sources xkb-options "['grp:alt_shift_toggle']"
gsettings get org.gnome.desktop.input-sources xkb-options
```

Done — **Alt+Shift** now toggles layouts and the setting **survives** reboots/logins.
