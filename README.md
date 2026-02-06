# Vibe Coding Devcontainer Setup

This project contains configuration files (dotfiles) and a setup script to initialize a development environment. It is primarily designed to be used within a Dev Container context.

## Contents

- **setup_env.sh**: A bash script that creates symlinks for the configuration files.
- **dotfiles/**: Directory containing the actual configuration files.
  - `.zshrc`: Zsh shell configuration.
  - `.oh-my-zsh/`: Oh My Zsh configuration and plugins.
  - `.opencode/`: OpenCode specific settings.

## VS Code Dev Container Instructions

This repository includes a [Dev Container](https://containers.dev/) configuration (`.devcontainer` folder), allowing you to open the project in a fully configured Docker environment.

### 1. Prerequisites
- **Docker**: Ensure Docker Desktop (or Engine) is installed and running.
- **VS Code Extension**: Install the [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension.

### 2. Open in Dev Container
1. Open this repository folder in VS Code.
2. An alert may appear asking to reopen in a container. Click **Reopen in Container**.
3. If not, open the Command Palette (`Ctrl+Shift+P` or `F1`) and run:
   `Dev Containers: Reopen in Container`

VS Code will build the Docker image and restart inside it.

### 3. Initialize Environment
Once the container is running and the terminal is active, apply the custom configurations by running:

```bash
./setup_env.sh
```

## How to Use (Manual)

If you are not using the specific Dev Container configuration but want to use these dotfiles in another Linux environment:

### Prerequisites

- A Linux environment (specifically designed for Dev Containers).
- `bash` shell.

### Installation

1. Clone this repository into your environment.

2. Make the script executable:

   ```bash
   chmod +x setup_env.sh
   ```

3. Run the setup script:
   ```bash
   ./setup_env.sh
   ```

### What the script does

1. **Verification**: Checks if the source files exist in the specified `dotfiles` directory.
2. **Backup**: Safely backs up any existing configuration files in your home directory (`$HOME`) by appending `.bak` to them (e.g., `.zshrc` becomes `.zshrc.bak`).
3. **Linking**: Creates symbolic links from the repository's `dotfiles` to your home directory, ensuring your environment uses the provided configurations.
