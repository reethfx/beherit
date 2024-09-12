{ pkgs, ... }:

{
  # Define la versión de Home-Manager que estás usando
  home.stateVersion = "24.11";

  programs.hyprland = {
    enable = true;
    config = {
      layout = "es";
      gapsIn = 5;
      gapsOut = 10;
      bind = {
        "SUPER+RETURN" = "exec ${pkgs.fish}/bin/fish";  # Fish como terminal
        "SUPER+Q" = "killactive";  # Atajo para cerrar ventanas
      };
    };
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_greeting "Welcome to Fish on Hyprland!";
    '';
  };

  # Configuración de Git
  programs.git = {
    enable = true;
    userName = "reethfx";
    userEmail = "reethb3rsrk@gmail.com";
  };

  services.redshift = {
    enable = true;
    latitude = "40.4168";
    longitude = "-3.7038";
    tempDay = 6500;
    tempNight = 3500;
  };
}
