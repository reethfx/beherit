{  pkgs, lib, inputs, ... }:
{
  # Install firefox.
  programs.firefox.enable = true;
  
  #Hyprland declaration
  #programs.hyprland.enable = true;
  #programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
     wget
     vim
     git
     vscode
     inputs.nixpkgs.legacyPackages.${pkgs.system}.neovim
  ];
}