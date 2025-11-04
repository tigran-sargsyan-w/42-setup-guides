# 02 — VS Code setup (C, C++, Norminette)

## Extensions
- C/C++ (ms-vscode.cpptools)
- CodeLLDB (vadimcn.vscode-lldb) or C/C++ Extension Pack
- Makefile Tools (ms-vscode.makefile-tools)
- 42 Header (optional, there are many variants)
- EditorConfig (editorconfig.editorconfig)
- Markdown All in One (yzhang.markdown-all-in-one)

## Settings (JSON snippet)
Open **Settings (JSON)** and add:
```json
{
    "editor.tabSize": 4,
    "editor.insertSpaces": true,
    "files.eol": "\n",
    "files.trimTrailingWhitespace": true,
    "makefile.configureOnOpen": false,
    "C_Cpp.intelliSenseEngine": "default",
    "editor.rulers": [80],
    "terminal.integrated.defaultProfile.linux": "bash"
}
```

## Tasks example
Create `.vscode/tasks.json`:
```json
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "make",
      "type": "shell",
      "command": "make -j$(nproc)",
      "group": "build",
      "problemMatcher": "$gcc"
    },
    {
      "label": "run",
      "type": "shell",
      "command": "./a.out",
      "dependsOn": "make"
    }
  ]
}
```

## Norminette in VS Code
- Use the `norminette` CLI (see `docs/04-norminette.md`).
- Optionally wire it as a task or problem matcher.
