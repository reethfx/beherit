{  pkgs, lib, inputs, ... }:

{
 networking.hostName = "beherit"; # FIXME Set your hostname.
  networking.networkmanager.enable = true;
}