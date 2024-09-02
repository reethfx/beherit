# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{  pkgs, lib, inputs, ... }:

{
  imports = [
      ./hardware-configuration.nix
      ./modules/bootloader.nix
      ./modules/networking.nix
      ./modules/packages.nix
      ./modules/pipewire.nix
      ./modules/services.nix
      inputs.home-manager.nixosModules.default
    ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.reeth = {
    isNormalUser = true;
    description = "reeth";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird

    ];
  };

  system.stateVersion = "24.05"; # Did you read the comment?

}
