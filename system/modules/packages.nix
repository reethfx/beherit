{  pkgs, lib, inputs, ... }:
{
  # Install firefox.
  programs.firefox.enable = true;
  
  #Hyprland declaration
  #programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;

  # Allow unfree packages

  environment.systemPackages = with pkgs; [
     wget
     vim
     git
     inputs.nixpkgs.legacyPackages.${pkgs.system}.neovim
  ];
}