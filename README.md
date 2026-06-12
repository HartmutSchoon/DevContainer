# 🏔️ Arch Linux DevContainer

A high-performance, Arch-based development container designed for a seamless, keyboard-driven, CLI-centric workflow. This environment bridges the gap between a lightweight container and a fully featured workstation, pre-configured with modern terminal tools, compiler toolchains, and host configuration mirroring.

<p align="center">
  <img src="https://img.shields.io/badge/OS-Arch%20Linux-1793D1?style=for-the-badge&logo=arch-linux&logoColor=white" alt="Arch Linux" />
  <img src="https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white" alt="Docker" />
  <img src="https://img.shields.io/badge/VS%20Code-007ACC?style=for-the-badge&logo=visual-studio-code&logoColor=white" alt="VS Code" />
  <img src="https://img.shields.io/badge/Shell-Zsh%20%26%20p10k-0966FE?style=for-the-badge&logo=gnu-bash&logoColor=white" alt="Zsh & Powerlevel10k" />
</p>

---

## ✨ Core Highlights

*   **⚡ Bleeding Edge OS**: Powered by Arch Linux with `multilib` support, ensuring you always have the latest toolchains.
*   **💻 Configuration Mirroring**: Mounts your host configurations (`nvim`, `tmux`, `.p10k.zsh`, scripts) read-only, making the container feel exactly like home.
*   **🧠 Intelligent Zsh**: Interactive shell equipped with **Oh My Zsh**, **Powerlevel10k**, auto-suggestions, and syntax highlighting.
*   **🤖 AI-Powered**: Includes the **Antigravity CLI / Gemini CLI** for integrated AI assistance directly in your terminal.
*   **🎯 Curated Extension Pack**: Automated environment bootstrapping with pre-loaded IDE extensions for debugging, formatters, and compilers.

---

## 🧰 The Toolbelt

Below is a summary of the compiler toolchains, terminal utilities, and integrations packaged in this container:

| Category | Tools | Description |
| :--- | :--- | :--- |
| **Languages & Runtimes** | `Rust`, `Python` (via `uv`), `Node.js` (`npm`) | Modern programming platforms and fast package managers. |
| **System Build** | `CMake`, `pkgconf`, `base-devel`, `blas`, `cblas` | Core libraries and build systems for native compilation. |
| **Data & Databases** | `mariadb-libs`, `jq`, `SQLite Viewer` | Client libraries and CLI utilities for processing structured data. |
| **Document Systems** | `texlive-meta`, `biber`, `LaTeX Workshop` | Comprehensive LaTeX publishing and compilation toolchain. |
| **File & Search** | `Yazi`, `ripgrep` (rg), `fd`, `fzf`, `zoxide` | Fast, terminal-based file management, fuzzy finding, and navigation. |
| **Terminal Enhancements** | `eza`, `bat`, `btop`, `tealdeer` (tldr) | Modern, feature-rich replacements for standard GNU utilities. |
| **Media Utilities** | `ffmpeg`, `imagemagick`, `poppler`, `resvg` | Robust libraries for processing images, video, and PDF rendering. |

---

## 🚀 Getting Started

Ensure you have **Docker** installed. If using VS Code, install the **Dev Containers** extension.

### Option A: VS Code Dev Containers (Recommended)

1. Open this repository folder in VS Code.
2. Click **"Reopen in Container"** in the bottom-right toast message or run the `Dev Containers: Reopen in Container` command from the Command Palette (`Ctrl+Shift+P` / `Cmd+Shift+P`).
3. VS Code will build the image and mount your files automatically.

### Option B: Interactive CLI Shell

Use the provided scripts to build and spin up the environment from any terminal:

```bash
# Step 1: Build the Docker image
./.devcontainer/build.sh

# Step 2: Spin up the interactive container
./.devcontainer/run.sh
```

---

## ⚙️ Host Integration & Personalization

To keep your workflow consistent, the container mirrors your host configurations using read-only bind mounts:

| Host Source | Container Destination | Purpose |
| :--- | :--- | :--- |
| `~/.p10k.zsh` | `/home/devuser/.p10k.zsh` | Powerlevel10k theme configuration |
| `~/.config/tmux` | `/home/devuser/.config/tmux` | Tmux environment & session configuration |
| `~/.tmux/plugins` | `/home/devuser/.tmux/plugins` | Preserves installed Tmux plugins |
| `~/.config/nvim` | `/home/devuser/.config/nvim` | Tailored Neovim config (AstroNvim, LazyVim, custom, etc.) |
| `~/.scripts` | `/home/devuser/.scripts` | Personal automation scripts available in `$PATH` |

> [!TIP]
> Changes made to your configurations on the host machine will automatically propagate inside the running container instantly.

> [!NOTE]
> All host mount-points are mapped as **read-only** (`ro`) to prevent the container's environment or language servers from unintentionally modifying your local configuration files.

---

## ⌨️ Shell Aliases & Functions

The shell comes equipped with modern, productivity-boosting aliases:

*   `ls` / `ll` / `la`: Mapped to `eza` with modern icons and details.
*   `cat`: Mapped to `bat` for syntax highlighting and Git diff integration.
*   `y`: A smart shell wrapper around **Yazi**. When you exit Yazi, your shell will automatically `cd` to the last directory you were browsing in the file manager.
*   `mensa`: Runs `/home/devuser/.scripts/mensa.sh`.
*   `syncpush`: Runs `/home/devuser/.scripts/syncpush.sh`.

---
*Built for developers who value speed, modern tooling, and the flexibility of Arch Linux.*
