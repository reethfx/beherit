{ config, pkgs, inputs, ... }: 

{
  services.openssh.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "es";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  services.tailscale.enable = true;

  # xdg.portal = {
  #   enable = true;
  #   xdgOpenUsePortal = true;
  #   extraPortals = [pkgs.xdg-desktop-portal-hyprland pkgs.xdg-desktop-portal-gtk];
  #   config.common.default = "*";
  # };
    
}