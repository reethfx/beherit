{  pkgs, lib, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
     wget
     vim
     inputs.nixpkgs.legacyPackages.${pkgs.system}.neovim
     git
     curl
     inputs.nixpkgs.legacyPackages.${pkgs.system}.neofetch
  ];
}