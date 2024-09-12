{ config, pkgs, inputs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./bootloader.nix
      ./locale.nix
      ./networking.nix
      ./packages.nix
      ./pipewire.nix
      ./services.nix
      ./user.nix
    ];
 
  system.stateVersion = "24.05";

}