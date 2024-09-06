# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{  pkgs, config, lib, osConfig, ... }:

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
    ];

   programs.hyprland.enable = true;

   xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [pkgs.xdg-desktop-portal-hyprland pkgs.xdg-desktop-portal-gtk];
    config.common.default = "*";
    };
   
   system.stateVersion = "24.05"; # FIXME: Change me to the actual version
  
}
