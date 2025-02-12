# My Personal NixOS Dotfiles with Nix Flakes

Welcome to my personal NixOS dotfiles repository, managed using Nix Flakes. This setup is tailored for my workflow, featuring Hyprland as the window manager, a fine-tuned vanilla Emacs configuration, and various essential tools like Fish shell and Alacritty terminal.

## 📌 Overview

This repository contains:

- **NixOS System Configuration**: Using Nix Flakes for reproducibility.
- **Hyprland WM**: A dynamic tiling window manager with a clean and modern look.
- **Fish Shell**: An intuitive and user-friendly shell with powerful auto-suggestions.
- **Alacritty Terminal**: A GPU-accelerated terminal emulator with custom themes and keybindings.
- **Essential Utilities**: A selection of tools and tweaks to improve productivity and usability.
- **Swaync**: A Wayland-native notification manager, replacing Dunst.
- **Emacs Setup**: A vanilla Emacs configuration.

## 🔧 Installation

To apply this configuration on your NixOS system:

```bash
git clone https://github.com/Azizul7m/flake.git
cd flake
nixos-rebuild switch --flake .
```

Make sure you have `nix` installed and flakes enabled.

## 🖥 Hyprland Configuration

Hyprland is configured with a balance of aesthetics and performance. Below is a table of keybindings:

| Keybinding | Action |
|------------|--------|
| `SUPER + Enter` | Open terminal (Alacritty) |
| `SUPER + Q` | Close window |
| `SUPER + J/K` | Cycle through windows |
| `SUPER + SHIFT + J/K` | Move window focus |
| `SUPER + D` | Open application launcher (Rofi) |
| `SUPER + 1-9` | Switch workspaces |
| `SUPER + SHIFT + 1-9` | Move window to workspace |
| `SUPER + F` | Toggle fullscreen |
| `SUPER + SHIFT + R` | Reload Hyprland config |

## 📝 Emacs Configuration

This is a **Vanilla Emacs** setup using the **Doom One** colorscheme. Key features include:

- **Evil Mode** for Vim-like navigation.
- **Org-mode** for notes and productivity.
- **LSP Support** for smooth coding experience in multiple languages.
- **Custom Keybindings** for an optimized workflow.
- **Doom One Theme** for a consistent and pleasant look.

## 🖥️ Alacritty Terminal

Alacritty is set up as the primary terminal with the following configurations:

| Keybinding | Action |
|------------|--------|
| `CTRL + SHIFT + T` | Open a new tab |
| `CTRL + SHIFT + W` | Close tab |
| `CTRL + SHIFT + C` | Copy text |
| `CTRL + SHIFT + V` | Paste text |
| `CTRL + SHIFT + Plus` | Increase font size |
| `CTRL + SHIFT + Minus` | Decrease font size |

## 🐟 Fish Shell

Fish is configured with helpful aliases for convenience:

| Alias | Command |
|-------|---------|
| `ll` | `ls -lah` |
| `gs` | `git status` |
| `gp` | `git push` |
| `gd` | `git diff` |
| `cat` | `bat` |
| `find` | `fd` |
| `vim` | `nvim` |
| `..` | `cd ..` |
| `...` | `cd ../..` |
| `grep` | `rg` |

## 🎯 Additional Utilities

Other useful tools and tweaks included in this configuration:

- **Waybar**: A minimal yet powerful status bar.
- **Swaync**: A Wayland-native notification daemon.
- **Rofi**: A stylish application launcher.
- **Zoxide**: Smart directory navigation.
- **Starship**: A fast, customizable shell prompt.
- **Stylix**: Manages system-wide theming with a consistent color scheme.

## 📜 License

This configuration is released under the [MIT License](LICENSE).

## 📬 Contact

For any questions or suggestions, reach out via [GitHub Issues](https://github.com/Azizul7m/flake/issues).

