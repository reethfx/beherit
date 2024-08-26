{ config, pkgs, ... }:

{
  users.users.reeth = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    packages = with pkgs; [
      home-manager
    ];
  };

  services.openssh.enable = true;
  services.openssh.permitRootLogin = "no";

  networking.firewall.enable = true;
}
