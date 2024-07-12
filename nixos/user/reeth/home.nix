
{ config, pkgs, ... }:

{
  home = {
    username = "reeth"; # Reemplaza con tu nombre de usuario
    homeDirectory = "/home/reeth";
    stateVersion = "24.11";

    programs = {
      home-manager = {
        enable = true;
      };

      hyprland = {
        enable = true;
      };

    };
  };
}
