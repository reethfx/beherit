{ pkgs, lib, ... }:

{
  wayland.windowManager.hyprland = {    
    settings = {
     "$mod" = "SUPER";

     general = with config.colorScheme.colors; {
       "col.active_border" = "rgba(${base0E}ff) rgba(${base09}ff) 60deg";
       "col.inactive_border" = "rgba(${base00}ff)";
      };

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
          6)
      );
    } 
  };
}
