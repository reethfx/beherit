
{ config, pkgs, ... }:

{
  networking.hostName = "beherit"; # Define your hostname.
  networking.networkmanager.enable = true;
}