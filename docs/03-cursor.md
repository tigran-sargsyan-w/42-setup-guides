# 03 — Change cursor theme (no sudo required) 🖱️✨

A short, practical guide to install and enable the Bibata cursor theme without requiring sudo. This installs the theme into your home directory so you can test or use it per-user.

## 1) Download the theme 📥
- Go to the Releases page and download the archive you like. Example repo: https://github.com/ful1e5/Bibata_Cursor/releases

I like the Bibata Modern / Ice variant. After downloading the tar.xz archive (for example `Bibata-Modern-Ice.tar.xz`) continue with the steps below.

## 2) Extract into your local icons folder 📂
Create the per-user icons directory and extract the archive there:

```bash
mkdir -p ~/.icons
cd /path/where/you/downloaded
# extract into ~/.icons
tar -xf Bibata-Modern-Ice.tar.xz -C ~/.icons
```

If you picked a different archive, replace the filename. Available names include:
- Bibata-Modern-{Ice,Classic,Amber} 🎨
- Bibata-Original-{Ice,Classic,Amber} 🧭

There are also right-handed variants with `-Right` suffix (e.g. `Bibata-Modern-Ice-Right`) 👉.

## 3) Enable the cursor theme ▶️

GNOME (shell) 🐧

```bash
gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Ice'
gsettings set org.gnome.desktop.interface cursor-size 32   # optional
```

Then log out and log back in to see the change.

Xfce 🖥️

```bash
xfconf-query -c xsettings -p /Gtk/CursorThemeName -s 'Bibata-Modern-Ice'
xfconf-query -c xsettings -p /Gtk/CursorThemeSize -n -t int -s 32
```

Then log out and log back in.

Universal for X11 (i3, Openbox, etc.) 💻

Create a default theme pointer in `~/.icons/default` that inherits your chosen theme:

```bash
mkdir -p ~/.icons/default
cat > ~/.icons/default/index.theme << 'EOF'
[Icon Theme]
Inherits=Bibata-Modern-Ice
EOF
```

Then log out and back in (or restart the X session). Some environments may require reloading the X settings or restarting the window manager.

## Alternative: install from the repository into your home directory (no sudo) 🔧

If you prefer to clone the repo and use the included installer to copy files into your home folder:

```bash
cd /tmp
git clone https://github.com/ful1e5/Bibata_Cursor.git
cd Bibata_Cursor
# the installer can copy the chosen theme into ~/.icons (or ~/.local/share/icons)
./build.sh -t Bibata-Modern-Ice -d ~/.icons
```

Adjust `-t` and `-d` to the theme name and destination you prefer.

## Notes and troubleshooting 📝
- Replace `Bibata-Modern-Ice` with the exact theme directory name you extracted or installed.
- If the cursor does not change, ensure your desktop environment uses the X cursor theme (Wayland vs X11 differences) and that `~/.icons` is readable by your user.
- Some apps (or Wayland compositors) may need a full relogin or restart to pick up the new cursor.
- If you later want to remove the theme, remove the extracted directory from `~/.icons` or undo the `index.theme` file.
