# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{  pkgs, config, lib, inputs, osConfig, ... }:

{
  imports = [
      ./hardware-configuration.nix
      
      ./modules/bootloader.nix
      ./modules/locale.nix
      ./modules/networking.nix
      ./modules/packages.nix
      ./modules/pipewire.nix
      ./modules/services.nix
      ./modules/user.nix

      inputs.home-manager.nixosModules.default
    ];

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland; #Hyprland Flake input temp fix
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

   system.stateVersion = "24.05"; # FIXME: Change me to the actual version
  
}
