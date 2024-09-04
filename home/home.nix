{ config, pkgs, hyprland, ags, ... }:

let
  hyprlandConfig = import ./dotnet/hyprland/default.nix { inherit pkgs hyprland; };
  packages = import ./dotnet/packages.nix { inherit pkgs; };
in
{
  programs.home-manager.enable = true;

  home.stateVersion = "24.11";

  home.username = "reeth";
  home.homeDirectory = "/home/reeth";

  home.packages = packages;

  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.settings = hyprlandConfig;

  programs.fish.enable = true;
}
