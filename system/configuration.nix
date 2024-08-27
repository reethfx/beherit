
{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules/modules.nix
    ];

  system.stateVersion = "24.05"; # FIXME Ensure that this is your system version.
}