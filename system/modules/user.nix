
{ config, pkgs, ... }:

{
  users.users.reeth = {
    isNormalUser = true;
    description = "reeth";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
        git
        curl
        wget
        vim
    ];
  };
}