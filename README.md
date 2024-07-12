<div align="center"><img src="https://cdn.discordapp.com/attachments/884503172578693120/1252029961519497329/StigmaOS.png?ex=66852a84&is=6683d904&hm=196392287609ea2fad6fbea32383bfe308721a3ba4698b8f04cff8cb8437aa35&" width="250" height="250"</img></div>

<h1 align="center">Beherit - ベルセルク</h1>

Thank you for visiting and exploring my world of aesthetics and beauty based on the famous dark fantasy world. May your creative journey be as splendid as the eclipe from which "Beherit" takes its name.


<div align="center">

![nixos](https://img.shields.io/badge/NixOS-24273A.svg?style=flat&logo=nixos&logoColor=CAD3F5)
![nixpkgs](https://img.shields.io/badge/nixpkgs-unstable-informational.svg?style=flat&logo=nixos&logoColor=CAD3F5&colorA=24273A&colorB=8aadf4)
![hyprland](https://img.shields.io/badge/hyprland-stable-informational.svg?style=flat&logo=wayland&logoColor=eed49f&colorA=24273A&colorB=91d7e3)

</div>

## Table of Contents
- [About](#-about)
- [Showcase](#-showcase)
- [Components](#-components)
- [Features](#-features)
- [Installation](#-installation)
- [Keybindings](#️-keybindings)
- [Useful aliases in Fish Shell](#-useful-aliases-in-fish-shell)

## 📖 About

This system leverages cutting-edge channels and versions of software to provide you with the latest updates and features. Notably, it utilizes:

- **flake** (An experimental feature of the Nix package manager)
- **nixpkgs**: unstable

This approach ensures that you stay on the forefront of technology, receiving the most recent software advancements promptly. 🚨 However, it's important to note that this emphasis on bleeding-edge software may impact the stability of the system.

You have the flexibility to customize these configurations according to your needs by modifying the respective configuration files. 

## 🔧 Components

| Component             | Version/Name                |
|-----------------------|-----------------------------|
| Distro                | NixOS                       |
| Shell                 | Fish                        |
| WM (Compositor)       | Hyprland                    |
| Bar                   | Waybar                      |
| Notification          | Dunst                       |
| Terminal              | Kitty + Starship            |
| Night Gamma           | Gammastep                   |
| Fetch Utility         | Neofetch                    |

## 🚀 Installation

1. Download and Install NixOS from the [official site](https://nixos.org/download).

2. Temporarily install ripgrep and fish using the command: `nix-shell -p ripgrep fish --run fish`. You can also use classic bash and grep for the next step without installing fish and ripgrep.

3. Run the command `rg --hidden FIXME` and change/add lines to match your device, swaps, partitions, peripherals, file systems, etc. in the configuration files. 

4. Also enable flake on your current configuration. You can simply do it by editing `/etc/nixos/configuration.nix` and adding the follow line: `nix.settings.experimental-features = ["nix-command" "flakes"];`.

## ⌨️ Keybindings

| Key Combination        | Action                       |
|------------------------|------------------------------|
| ALT + R                | Resize windows mode          |
| ALT + M                | Move windows mode            |


You can find all other keybindings in `/home/.config/hypr/hyprland.conf` in the bind section. All system fish scripts are located at `/home/.config/fish/functions` directory.

## 💻 Gallery

## 🧵 Inspiration
