
{ config, pkgs, ... }:

{
  # Install firefox.
  programs.firefox.enable = true;

  programs.hyprland = {
    enable = true;
    nvidiaPatches = true;
    xwayland.enable = true;
  };

  environment.systemVariables = {
    WLR_NO_HARDWARE_CURSORS = "1"; # Disable hardware cursors
    NIXOS_OZONE_WL = "1"; # Hint electron apps to force wayland
  };

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