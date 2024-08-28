{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    extraConfig = ''
      # Aquí puedes añadir tu configuración personalizada de Hyprland
      bind = SUPER, Return, exec, kitty
      bind = SUPER, Q, killactive,
      bind = SUPER, M, exit,
      bind = SUPER, E, exec, dolphin
      bind = SUPER, V, togglefloating,
      bind = SUPER, R, exec, wofi --show drun
      bind = SUPER, P, pseudo,
      bind = SUPER, J, togglesplit,
    '';
  };

  home.packages = with pkgs; [
    btop 
    vscode
    firefox
    dunst
    discord
    swww
    neovim
    fish
    starship
  ];
}
