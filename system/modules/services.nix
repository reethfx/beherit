{ config, pkgs, ... }: 

{
  services.openssh.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.xserver = {
    enable = true;
    windowManager.hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
      terminal = "${pkgs.fish}/bin/fish";  # Establece Fish como terminal por defecto
    };
    displayManager = {
      defaultSession = "hyprland";
      lightdm.enable = true;
      greeter = {
        enable = true;
        package = pkgs.hyprlock;  # Hyprlock como greeter por defecto
      };
    };
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  services.tailscale.enable = true;

  programs.hyprland.enable = true;

  # xdg.portal = {
  #   enable = true;
  #   xdgOpenUsePortal = true;
  #   extraPortals = [pkgs.xdg-desktop-portal-hyprland pkgs.xdg-desktop-portal-gtk];
  #   config.common.default = "*";
  # };
    
}