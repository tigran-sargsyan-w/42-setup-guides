# 06 — Docker & Dev Containers (optional but powerful)

## Why
- Identical environment for grading
- Easy cleanup
- Works on Linux/macOS/WSL2

## Devcontainer template
Create `.devcontainer/devcontainer.json`:
```json
{
  "name": "42 C Dev",
  "image": "gcc:13",
  "features": {
    "ghcr.io/devcontainers/features/common-utils:2": {}
  },
  "customizations": {
    "vscode": {
      "extensions": [
        "ms-vscode.cpptools",
        "ms-vscode.makefile-tools",
        "editorconfig.editorconfig"
      ]
    }
  }
}
```

Then: open folder in container via VS Code.
