# 06 — Add “Open in VS Code” to Nautilus Context Menu 🐧📁

This guide explains how to add an **Open in VS Code** action to the right-click menu in Ubuntu’s default file manager, **Nautilus**.

It works **without sudo** by using the built-in Nautilus scripts system.

> Target result:
>
> ```text
> Right click on file/folder → Scripts → Open in VS Code
> ```

---

## ✅ Goal

After this setup, you will be able to right-click a file or folder in Nautilus and open it directly in Visual Studio Code.

This is useful on 42 school computers or restricted Linux environments where you may not have administrator permissions.

---

## ⚠️ Important Note

This method does **not** add the item directly to the top-level context menu.

It adds it here:

```text
Right click → Scripts → Open in VS Code
```

To add a top-level item like this:

```text
Right click → Open in VS Code
```

you usually need the `python3-nautilus` package, which requires `sudo` to install.

So this guide focuses on the **no-sudo** solution.

---

## 1. Check that the `code` command works

First, make sure Visual Studio Code can be launched from the terminal:

```bash
code --version
```

If this prints a version number, you are good.

You can also check its path:

```bash
which code
```

Example output:

```text
/usr/bin/code
```

or, for a portable/local setup:

```text
/home/your-login/.local/bin/code
```

If `code` is not found, you need to make sure VS Code is correctly available from your terminal before continuing.

---

## 2. Create the Nautilus scripts directory

Nautilus looks for user scripts in this directory:

```bash
~/.local/share/nautilus/scripts
```

Create it if it does not exist:

```bash
mkdir -p ~/.local/share/nautilus/scripts
```

---

## 3. Create the “Open in VS Code” script

Create the script file:

```bash
nano ~/.local/share/nautilus/scripts/Open\ in\ VS\ Code
```

Paste this content:

```bash
#!/bin/bash

if [ "$#" -eq 0 ]; then
    code "$PWD"
else
    code "$@"
fi
```

Save and exit nano:

```text
Ctrl + O
Enter
Ctrl + X
```

---

## 4. Make the script executable

Run:

```bash
chmod +x ~/.local/share/nautilus/scripts/Open\ in\ VS\ Code
```

Check the permissions:

```bash
ls -la ~/.local/share/nautilus/scripts
```

Expected result:

```text
-rwxr-xr-x ... Open in VS Code
```

The important part is the `x`, which means the script is executable.

---

## 5. Restart Nautilus

Run:

```bash
nautilus -q
```

Then open **Files** again.

---

## 6. Test it

Open Nautilus and right-click on a file or folder.

You should now see:

```text
Scripts → Open in VS Code
```

Click it, and the selected file or folder should open in Visual Studio Code.

---

## 🧪 Quick test script

If the menu does not appear, create a simple test script:

```bash
cat > ~/.local/share/nautilus/scripts/Test << 'EOF'
#!/bin/bash

notify-send "Nautilus script works" "$@"
EOF

chmod +x ~/.local/share/nautilus/scripts/Test
nautilus -q
```

Then right-click a file or folder:

```text
Right click → Scripts → Test
```

If a notification appears, Nautilus scripts are working correctly.

---

## 🛠 Troubleshooting

### The `Scripts` menu does not appear

Make sure you are right-clicking on a **file or folder**, not only on empty space.

Also check that your script is executable:

```bash
ls -la ~/.local/share/nautilus/scripts
```

You should see:

```text
-rwxr-xr-x ... Open in VS Code
```

If not, run again:

```bash
chmod +x ~/.local/share/nautilus/scripts/Open\ in\ VS\ Code
nautilus -q
```

---

### VS Code does not open

Check if the `code` command exists:

```bash
which code
```

If nothing is printed, Nautilus can show the menu item, but the script cannot launch VS Code.

You need to fix the `code` command first.

---

### I want it directly in the main context menu

This no-sudo method cannot do that.

This works:

```text
Right click → Scripts → Open in VS Code
```

This usually requires a Nautilus extension:

```text
Right click → Open in VS Code
```

For that, the system needs:

```bash
python3-nautilus
```

Usually installed with:

```bash
sudo apt install python3-nautilus
```

Without `sudo`, this is usually not available on restricted machines.

---

## 🧹 Remove the script

To remove the menu item:

```bash
rm ~/.local/share/nautilus/scripts/Open\ in\ VS\ Code
nautilus -q
```

---

## ✅ Final result

You now have a no-sudo Nautilus context menu action:

```text
Right click on file/folder → Scripts → Open in VS Code
```

This is not as direct as the Windows context menu integration, but it is simple, portable, and works well in restricted Linux environments.
