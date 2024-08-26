{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  # Configuración básica del sistema
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "beherit"; # Cambia al nombre de host deseado
  time.timeZone = "Europe/Madrid"; # Cambia a tu zona horaria

  # Configuración del teclado
  i18n.defaultLocale = "es_ES.UTF-8";
  console.keyMap = "es";

  # Paquetes globales
  environment.systemPackages = with pkgs; [
    vim
    git
    wget
  ];

  # Servicios
  services.xserver.enable = true;
  services.xserver.layout = "es";
  services.xserver.windowManager.hyprland.enable = true;

  programs.home-manager.enable = true;
}
