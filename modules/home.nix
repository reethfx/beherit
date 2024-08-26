{ config, pkgs, ... }:

let
  home-manager = pkgs.fetchFromGitHub {
    owner = "nix-community";
    repo = "home-manager";
    rev = "release-23.05";
    sha256 = "sha256-value";
  };
in
{
  imports = [
    home-manager.nixosModules.home-manager
  ];

  home-manager.useGlobalPkgs = true;

  home-manager.users.reeth = {
    home.sessionVariables = {
      EDITOR = "nvim";
    };

    programs.home-manager.enable = true;

    # Configuración de Hyprland
    home.packages = [
      pkgs.hyprland
      pkgs.hyprlock
      ags.defaultPackage.${pkgs.system}  # Usando AGS de Aylur
    ];

    # Configuración específica de AGS (Aylur)
    xsession.windowManager.command = "${pkgs.hyprland}/bin/Hyprland";
    services.ags = {
      enable = true;
      settings = {
        # Aquí puedes configurar los módulos y la barra según tus preferencias
      };
    };

    # Configuración de Hyprlock para bloquear la sesión
    xsession.windowManager.command = "${pkgs.hyprlock}/bin/hyprlock";
  };
}
