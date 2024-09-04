{  pkgs, lib, ... }:

{
 networking.hostName = "beherit"; # FIXME Set your hostname.
  networking.networkmanager.enable = true;
}