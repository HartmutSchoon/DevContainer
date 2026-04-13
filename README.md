# 🏔️ Arch Linux Development Environment

A high-performance, Arch-based development container designed for a seamless, CLI-centric workflow. This environment bridges the gap between a lightweight container and a fully-featured workstation, pre-configured with modern tooling and intelligent defaults.

## ✨ Core Highlights

*   **Bleeding Edge**: Built on Arch Linux with `multilib` support, ensuring access to the latest packages.
*   **Intelligent Shell**: Zsh powered by Oh My Zsh, Powerlevel10k, and auto-suggestions for maximum productivity.
*   **Native Performance**: Optimized for fast startup and minimal overhead, running as a non-root `devuser`.
*   **VS Code Integration**: First-class support via Dev Containers with a curated list of extensions.
*   **AI-Powered**: Includes the **Gemini CLI** for integrated AI assistance directly in your terminal.

## 🧰 The Toolbelt

### 🛠️ Build & Systems
*   **Languages**: Rust, Python (with `uv`), Node.js (with `npm`).
*   **Build Tools**: CMake, pkgconf, base-devel.
*   **Databases**: MariaDB client libraries.

### ⌨️ Terminal Essentials
*   **Editor**: Neovim (v0.10+) with host config mirroring.
*   **Multiplexer**: Tmux with pre-configured session management.
*   **File Management**: [Yazi](https://github.com/sxyazi/yazi) (modern terminal file manager) with a smart directory-sync wrapper.
*   **Search**: `ripgrep` (rg), `fd`, `fzf`, `jq`.

### 🚀 Productivity Boosters
*   `eza`: Modern `ls` with icons and git integration.
*   `bat`: Syntax-highlighting `cat`.
*   `zoxide`: Smarter `cd` that learns your habits.
*   `btop`: Interactive system monitor.
*   `tealdeer`: High-speed `tldr` implementation.

## 🚀 Getting Started

### 1. Prerequisites
Ensure you have **Docker** and (optionally) **VS Code** with the **Dev Containers** extension installed.

### 2. Quick Launch (CLI)
Use the automated scripts to build and run your environment:

```bash
# Build the image (names it based on your folder)
./.devcontainer/build.sh

# Launch the interactive container
./.devcontainer/run.sh
```

### 3. VS Code Workflow
Simply open the project folder in VS Code and click **"Reopen in Container"** when prompted. The environment will automatically set up all extensions and settings.

## ⚙️ Customization & Host Integration

The container is designed to feel like your local machine by mounting your personal configurations as read-only volumes:

*   **Neovim**: Mirrors `~/.config/nvim`
*   **Tmux**: Mirrors `~/.config/tmux` and plugins.
*   **Zsh**: Supports your local `.p10k.zsh` for a consistent prompt.
*   **Scripts**: Access your local `~/.scripts` directory directly inside the container.

### Useful Aliases
*   `ls`, `ll`, `la`: Alias to `eza` with icons and detail views.
*   `cat`: Alias to `bat`.
*   `y`: Launches Yazi and automatically `cd`s to the last directory upon exit.

---
*Built for developers who value speed, modern tooling, and the flexibility of Arch Linux.*
