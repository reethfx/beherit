{ config, pkgs, hyprland, ags, ... }:

{
  programs.home-manager.enable = true;

  home.stateVersion = "24.11";

  home.username = "reeth";
  home.homeDirectory = "/home/reeth";

  home.packages = with pkgs; [
    kitty                                   
    neovim
    fish
    alacritty                                      
  ];

  programs.kitty.enable = true; # required for the default Hyprland config

  wayland.windowManager.hyprland.enable = true; # enable Hyprland
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    bind =
      [
        "$mod, F, exec, firefox"
        ", Print, exec, grimblast copy area"
      ]
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
        builtins.concatLists (builtins.genList (i:
            let ws = i + 1;
            in [
              "$mod, code:1${toString i}, workspace, ${toString ws}"
              "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            ]
          )
          9)
      );
  };

  # Configuraciones adicionales
  # Puedes agregar más configuraciones como shell, editor, etc.
}
