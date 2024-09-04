{ pkgs, config, lib, ... }:
{
  environment.systemPackages = with pkgs; [
     wget
     vim
     git
     curl
  ];

}