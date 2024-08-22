{ config, pkgs, ... }:
  {
  networking.hostName = "b3rsrk";
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;
}