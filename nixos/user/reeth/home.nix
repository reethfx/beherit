
{ config, pkgs, ... }:

{
  home = {
    username = "reeth"; #FIXME 
    homeDirectory = "/home/reeth";
    stateVersion = "24.11";


      wayland.windowManager.hyprland.enable = true;
    };
}
