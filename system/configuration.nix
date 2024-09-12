{ config, pkgs, inputs, ... }:

{
  imports =
    [ 
      ./modules/hardware-configuration.nix
      ./modules/bootloader.nix
      ./modules/locale.nix
      ./modules/networking.nix
      ./modules/packages.nix
      ./modules/pipewire.nix
      ./modules/services.nix
      ./modules/user.nix
    ];
 
  system.stateVersion = "24.05";

} 
