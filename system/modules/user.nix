{  config, pkgs, lib, ... }:

{
  users.users.reeth = {
    isNormalUser =  true;
    extraGroups = [ "wheel" "networkmanager" ];
    home = "/home/reeth";
  };
}