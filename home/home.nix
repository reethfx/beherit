{ config, pkgs, ... }:

{
   #FIXME change this block to your username
  home.username = "reeth"; #FIXME 
  home.homeDirectory = "/home/reeth";
  home.stateVersion = "23.05"; #FIXME Ensure that this is your home-manager version.

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "reethfx";
    userEmail = "reethb3rsrk@gmail.com";
  };
}
