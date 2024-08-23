  
{ config, pkgs, ...}:
  {
  programs = {
    hyprland.enable = true;
    steam = {
      enable = true;
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true;
    };

    gamemode.enable = true;
  };
}