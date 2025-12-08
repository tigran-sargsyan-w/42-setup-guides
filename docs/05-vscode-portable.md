# 05 — VS Code Portable (Zsh, no sudo) 🛠️

This guide shows how to install a **portable version of Visual Studio Code** under your home directory on Linux, **without sudo**. You will:

* download VS Code as a `.tar.gz` archive;
* extract it into `~/Progs`;
* create a `code` alias in **zsh** so that `code .` runs **your** VS Code binary;
* learn how to **update** this version later without admin rights.

---

## 1) Why use a portable VS Code? 🎒

* 🔒 **No admin rights?** The system `/usr/bin/code` is updated only via `sudo` and the package manager. The portable version lives in `$HOME`, and you fully control it.
* 🧹 **No touching system packages.** No conflicts with whatever is installed by school/IT.
* 💻 **Same workflow across distros.** You only need `wget` and `tar`.

> If the system already has `code` in `/usr/bin`, we simply override it with an **alias** in zsh. We do not remove or modify the system binary.

---

## 2) Download the VS Code archive 📦

1. Open a terminal.
2. Create a directory for your personal programs (if it does not exist yet):

```bash
mkdir -p ~/Progs
cd ~/Progs
```

3. Download VS Code for Linux x64 as an archive:

```bash
wget -O vscode.tar.gz "https://code.visualstudio.com/sha/download?build=stable&os=linux-x64"
```

> 💡 If you are not on x86_64 (e.g. ARM), grab the appropriate link from the VS Code website and use it instead.

---

## 3) Extract into `~/Progs` 📂

1. While inside `~/Progs`, extract the archive:

```bash
tar -xzf vscode.tar.gz
```

2. After extraction you should see a folder like `VSCode-linux-x64`. Rename it to something shorter:

```bash
mv VSCode-linux-x64 vscode
```

3. (Optional) Remove the archive to free space:

```bash
rm vscode.tar.gz
```

Now the VS Code binary lives at:

```bash
$HOME/Progs/vscode/bin/code
```

This is the one we will use.

---

## 4) Create a `code` alias in zsh ⚙️

We want the `code` command in **zsh** to launch this binary instead of the system `/usr/bin/code`.

1. Append an alias to your `~/.zshrc`:

```bash
echo 'alias code="$HOME/Progs/vscode/bin/code"' >> ~/.zshrc
```

2. Reload your zsh configuration in the current terminal:

```bash
source ~/.zshrc
```

3. Check that the correct command is used:

```bash
which code
```

You should see something like `code: aliased to /home/USERNAME/Progs/vscode/bin/code`.

4. Verify VS Code runs:

```bash
code --version
```

If everything is fine, you can use:

```bash
code .
```

in any project directory — this will open your local VS Code from `~/Progs/vscode`.

> Note: The alias works only in **zsh** (and only after loading `~/.zshrc`). In other shells, the system `/usr/bin/code` may still be used.

---

## 5) How to update your portable VS Code later 🔄

When a new VS Code version is released, you can update only your local copy without touching the system installation.

1. Close all VS Code windows.
2. In a terminal, run:

```bash
cd ~/Progs
wget -O vscode-new.tar.gz "https://code.visualstudio.com/sha/download?build=stable&os=linux-x64"
mkdir -p vscode-new
 tar -xzf vscode-new.tar.gz -C vscode-new --strip-components=1
```

3. Replace the old folder with the new one:

```bash
rm -rf vscode          # old version
mv vscode-new vscode   # new version in its place
rm vscode-new.tar.gz   # clean up the archive
```

4. The alias in `~/.zshrc` already points to `$HOME/Progs/vscode/bin/code`, so **no config changes are needed**.

5. Restart VS Code or run:

```bash
code --version
```

and confirm that the version has been updated.

---

## 6) Optional: desktop launcher 🖥️ (GUI icon)

This step is optional. If you are happy with `code .` from the terminal, you can skip it.

1. Create the directory for custom `.desktop` files (if it doesn’t exist):

```bash
mkdir -p ~/.local/share/applications
```

2. Create `~/.local/share/applications/vscode-portable.desktop` with this content:

```ini
[Desktop Entry]
Name=VS Code (Portable)
Comment=Visual Studio Code from $HOME/Progs
Exec=/home/YOUR_USERNAME/Progs/vscode/bin/code %F
Icon=/home/YOUR_USERNAME/Progs/vscode/resources/app/resources/linux/code.png
Terminal=false
Type=Application
Categories=Development;IDE;
StartupNotify=true
```

3. Replace `YOUR_USERNAME` with your actual login.
4. Log out and back in, or let your desktop environment refresh its app menu.

After this, the applications menu will show **“VS Code (Portable)”**, which launches your personal copy.

---

## 7) Quick checklist ✅

* [ ] `~/Progs` exists and the VS Code archive was downloaded there.
* [ ] The archive was extracted into `~/Progs/vscode`.
* [ ] `~/.zshrc` contains the alias:

  * `alias code="$HOME/Progs/vscode/bin/code"`
* [ ] `source ~/.zshrc` was run (or a new zsh terminal was opened).
* [ ] `which code` shows an alias to `~/Progs/vscode/bin/code`.
* [ ] `code --version` runs successfully.
* [ ] (Optional) A `.desktop` file was added for a menu icon.

---

## 8) TL;DR 📌

Minimal command set if you already know what you’re doing:

```bash
# 1. Download and extract VS Code into ~/Progs
mkdir -p ~/Progs && cd ~/Progs
wget -O vscode.tar.gz "https://code.visualstudio.com/sha/download?build=stable&os=linux-x64"
tar -xzf vscode.tar.gz && mv VSCode-linux-x64 vscode && rm vscode.tar.gz

# 2. Alias in zsh
echo 'alias code="$HOME/Progs/vscode/bin/code"' >> ~/.zshrc
source ~/.zshrc

# 3. Check
which code
code --version
```

You now have a **portable VS Code** in `~/Progs/vscode`, fully under your control and not requiring `sudo`. To update it, just download a new archive and **replace the `vscode` folder** as shown in sectio
