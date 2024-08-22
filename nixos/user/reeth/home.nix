
{ config, pkgs, ... }:

{
  home = {
    username = "reeth"; #FIXME 
    homeDirectory = "/home/reeth";
    stateVersion = "24.11";

    programs = {
      home-manager = {
        enable = true;
      };

      wayland.windowManager.hyprland.enable = true;

    };
  };
}
