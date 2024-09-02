{ pkgs, lib, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    
    settings = {
     general = with config.colorScheme.colors; {
       "col.active_border" = "rgba(${base0E}ff) rgba(${base09}ff) 60deg";
       "col.inactive_border" = "rgba(${base00}ff)";
      };
    } 
  };
}
