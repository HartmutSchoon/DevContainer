# Arch Linux DevContainer

A high-performance, secure, and feature-rich development environment powered by Arch Linux. This container is designed for developers who want a consistent, CLI-centric workflow with modern tooling and strict security boundaries.

## 🚀 Key Features

- **Base**: Lightweight and up-to-date Arch Linux (`multilib` enabled).
- **Shell**: Zsh with [Oh My Zsh](https://ohmyz.sh/), [Powerlevel10k](https://github.com/romkatv/powerlevel10k), and productivity plugins.
- **Terminal Excellence**: Multi-session support via `tmux` with a pre-configured [Catppuccin](https://github.com/catppuccin/tmux) theme.
- **Modern CLI**: Replaces legacy tools with faster alternatives (`eza`, `bat`, `ripgrep`, `fd`, `zoxide`).
- **User**: Runs as a non-privileged `devuser` with `sudo` access for maintenance.
- **Persisted Configs**: Automatically mounts your host's `nvim`, `tmux`, `git`, and `p10k` configurations for a seamless transition.

## 🧰 The Toolbox

This environment comes pre-loaded with a curated set of development tools:

| Category | Included Tools |
| :--- | :--- |
| **Languages** | Rust (stable), Python 3.x, [UV](https://github.com/astral-sh/uv) (Python pkg manager) |
| **Editors** | Neovim (v0.10+), Bash, Zsh |
| **Navigation** | [Yazi](https://github.com/sxyazi/yazi) (Terminal file manager), `fzf`, `zoxide` |
| **Search/Filter** | `ripgrep` (rg), `fd`, `jq` |
| **Monitoring** | `btop` |
| **Productivity** | `eza` (modern ls), `bat` (modern cat), `tealdeer` (tldr), `7zip`, `ffmpeg` |

## 🛠️ Getting Started

### 1. Prerequisites

- [Docker](https://www.docker.com/) installed and running.
- (Optional) [VS Code](https://code.visualstudio.com/) with the "Dev Containers" extension.

### 2. Build and Launch

Use the provided scripts in the project root to manage the life cycle of your environment:

- **Build the Image**:

  ```bash
  ./.devcontainer/build.sh
  ```

  *This script dynamically names the image based on your project directory.*

> [!NOTE]
> Building the image and connecting for the first time can take some time as it downloads necessary packages. Depending on your internet connection, **5-10 minutes** is typical for the initial setup.

- **Run the Container**:

  ```bash
  ./.devcontainer/run.sh
  ```

  *This starts an interactive session, mounts your project root to `/workspaces/<project_name>`, and pulls in your host configurations.*

## ⌨️ Productivity Features

### Custom Aliases

The environment includes pre-configured aliases in `.zshrc`:

- `ls`, `ll`, `la` → Powered by `eza` with icons.
- `cat` → Powered by `bat` for syntax highlighting.
- `y` → A custom wrapper for **Yazi** that changes your shell directory on exit.

### Host Integration

The following files/directories are mounted from your host (read-only) to maintain your personal workflow:

- `~/.config/nvim` or `~/.nvim` → `/home/devuser/.config/nvim`
- `~/.config/tmux` → `/home/devuser/.config/tmux`
- `~/.tmux/plugins` → `/home/devuser/.tmux/plugins`
- `~/.p10k.zsh` → `/home/devuser/.p10k.zsh`
- `~/.gitconfig` → `/home/devuser/.gitconfig`

