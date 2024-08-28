{ config, pkgs, ... }:

{
   #FIXME change this block to your username
  home.username = "reeth"; #FIXME 
  home.homeDirectory = "/home/reeth";
  home.stateVersion = "23.11"; #FIXME Ensure that this is your home-manager version.

  imports = [
    ./modules/hyprland/hyprland.nix
    ./modules/hyprlock.nix
    ./modules/hyprland/hyprland.nix
  ];


  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "reethfx";
    userEmail = "reethb3rsrk@gmail.com";
  };

  home.packages = with pkgs; [
    btop 
    vscode
    firefox
    dunst
    discord
    swww
    neovim
    fish
    starship
  ];
}
