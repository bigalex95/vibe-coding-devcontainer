# vibe-coding-devcontainer

Personal VS Code Dev Container for working with an AI coding assistant in a sandboxed Python environment, plus a script that symlinks my dotfiles into the container. Dev-environment tooling, not a project. Small and unmaintained.

## What's inside

```
.devcontainer/
  Dockerfile              python:3.11-bookworm, uv, git/curl/wget/sudo, non-root user "vscode", OpenCode CLI
  docker-compose.yml      Service "vibe-coding", mounts the repo at /workspace
  docker-compose.gpu.yml  Optional override that reserves one NVIDIA GPU
  devcontainer.json       VS Code extensions (Python, Pylance), zsh + Oh My Zsh via common-utils feature
setup_env.sh              Symlinks .zshrc, .opencode and .oh-my-zsh from ./dotfiles into $HOME (backs up existing ones to *.bak)
```

The `dotfiles/` directory that `setup_env.sh` reads from is personal and is listed in `.gitignore`, so it is not in the repo. Without it the script prints "Source ... does not exist. Skipping." for each entry and does nothing. Create your own `dotfiles/` with the files you want to link.

## Run

Needs Docker and the VS Code Dev Containers extension.

1. Open the folder in VS Code and run `Dev Containers: Reopen in Container`.
2. In the container terminal, optionally run `./setup_env.sh` (after adding your `dotfiles/`).

For GPU use, add `docker-compose.gpu.yml` to `dockerComposeFile` in `devcontainer.json` (requires the NVIDIA Container Toolkit). I did not build the container for this cleanup.

## Status

Personal tooling; works for my setup only.

## Credits

Uses the [uv](https://github.com/astral-sh/uv) image layer and the [OpenCode](https://opencode.ai) installer. MIT license, see `LICENSE`.
