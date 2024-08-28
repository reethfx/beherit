
{ config, pkgs, inputs, ... }:

{
  imports =
    [ 
     ./bootloader.nix
     ./locale.nix
     ./networking.nix
     ./packages.nix
     ./pipewire.nix
     ./services.nix
     ./user.nix
    ];
}