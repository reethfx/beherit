<div align="center"><img src="./media/beherit.png" width="250" height="250"</img></div>

<h1 align="center">Beherit - ベルセルク</h1>

Thank you for visiting and exploring my world of aesthetics and beauty based on the famous dark fantasy world. May your creative journey be as splendid as the eclipe from which "Beherit" takes its name.


<div align="center">

![https://nixos.org/](https://img.shields.io/badge/NixOS-24273A.svg?style=flat&logo=nixos&logoColor=CAD3F5) 
![https://search.nixos.org/packages](https://img.shields.io/badge/nixpkgs-unstable-informational.svg?style=flat&logo=nixos&logoColor=CAD3F5&colorA=24273A&colorB=8aadf4)
![https://hyprland.org/](https://img.shields.io/badge/hyprland-stable-informational.svg?style=flat&logo=wayland&logoColor=eed49f&colorA=24273A&colorB=91d7e3)

</div>

## Table of Contents
- [About](#-about)
- [Showcase](#-showcase)
- [Components](#-components)
- [Installation](#-installation)
- [Keybindings](#️-keybindings)
- [Inspiration](#-inspiration)

## 📖 About

This system leverages cutting-edge channels and versions of software to provide you with the latest updates and features. Notably, it utilizes:

- **flake** (An experimental feature of the Nix package manager)
- **nixpkgs**: unstable

This approach ensures that you stay on the forefront of technology, receiving the most recent software advancements promptly. 🚨 However, it's important to note that this emphasis on bleeding-edge software may impact the stability of the system.

You have the flexibility to customize these configurations according to your needs by modifying the respective configuration files. 

## 💻 Showcase
this is not ready yet since the project is on development

## 🔧 Components

| Component             | Version/Name                |
|-----------------------|-----------------------------|
| Distro                | NixOS                       |
| Shell                 | Fish                        |
| Terminal              | Kitty + Starship            |
| WM (Compositor)       | Hyprland                    |
| Bar                   | AGS                         |
| Notification          | Dunst                       |
| Night Gamma           | Gammastep                   |
| Fetch Utility         | Neofetch                    |


## 🚀 Installation

1. Download and Install NixOS from the [official site](https://nixos.org/download).

2. Exectue `nix-shell -p git` follwed by `git clone https:gtihub.com/reethfx/beherit ~/.config/beherit`.

2. Once installed, coppy your `hardware-configuration.nix` in the `./nixos/` directory inside the dotfiles.

3. Add this line `boot.loader.systemd-boot.enable = true;` on `hardware-configuration.nix`, you have the line example on the same example file on my configuration.

3. Temporarily install ripgrep and fish using the command: `nix-shell -p ripgrep fish --run fish`. You can also use classic bash and grep for the next step without installing fish and ripgrep.

4. Run the command `rg --hidden FIXME` and change/add lines to match your device, swaps, partitions, peripherals, file systems, etc. in the configuration files. 

5. Also enable flake on your current configuration. You can simply do it by editing `/etc/nixos/configuration.nix` and adding the follow line: `nix.settings.experimental-features = ["nix-command" "flakes"];`.

6. Coppy your clean autogenerated `hardware-configuaration.nix` on the dotfiles project executing `sudo cp /etc/nixos/hardware-configuration-nix ~/beheirt/nixos/`


## ⌨️ Keybindings

| Key Combination        | Action                       |
|------------------------|------------------------------|
| ALT + R                | Resize windows mode          |
| ALT + M                | Move windows mode            |
| WIN + Q                | Kill active window           |
| WIN + SHIFT + Q        | Exit                         |
| WIN + X                | Toggle floating mode         |

You can find all other keybindings in `/home/.config/hypr/hyprland.conf` in the bind section. All system fish scripts are located at `/home/.config/fish/functions` directory.


## 🧵 Inspiration
