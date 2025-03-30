# 🌿 Dotfiles – Arch + Hyprland Setup

Welcome to my personal dotfiles setup!  
This repo is built for [EndeavourOS](https://endeavouros.com/) / Arch Linux using the [Hyprland](https://github.com/hyprwm/Hyprland) Wayland compositor.  

---

## ⚙️ Features

- Includes configurations for:
  - `nvim`: [Code Editor](https://neovim.io/)
  - `zsh`: [Shell](https://www.zsh.org/)
  - `zellij`:  [Terminal Workspace](https://zellij.dev/)
  - `hyprland`: [Compositor](https://hyprland.org/)
  - `waybar`: [Bar](https://github.com/Alexays/Waybar)
  - `wofi`: [App Launcher](https://hg.sr.ht/~scoopta/wofi)
  - `kitty`: [Terminal](https://sw.kovidgoyal.net/kitty/)

---

## 📦 Dependencies

Make sure you have the following tools installed before running the setup:

```bash
# Arch-based
sudo pacman -S zsh hyprland wofi waybar stow git
yay -S hyprshot swaync hyprlock hypridle hyprpaper starship

# gtk theme
yay -S nwg-look
yay -Sy catppuccin-gtk-theme-mocha

# fonts
yay -S ttf-jetbrains-mono
```

## 🖼️ Showcase

![Hyprland Screenshot](./assets/hyprland.png)
![Neovim Screenshot](./assets/nvim.png)
