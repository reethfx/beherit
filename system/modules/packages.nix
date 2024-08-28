
{ config, pkgs, lib, inputs, ... }:

{
  # Install firefox.
  programs.firefox.enable = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  };

  # environment.systemVariables = {
  #   WLR_NO_HARDWARE_CURSORS = "1";
  #   NIXOS_OZONE_WL = "1";
  # };

  hardware = {
    #OpenGL
    opengl.enable = true;
    #NVIDIA compatibility
    nvidia.modesetting.enable = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
     wget
     curl
     git
     vim
  ];
}