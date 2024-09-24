{config}: [
  "dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"

  # Start the clipboard daemon
   "wl-paste --type text --watch cliphist store"
   "wl-paste --type image --watch cliphist store"

  # Start the wallpaper manager
  "swww-daemon"
  "swaybg -i ~/.config/wallpaper/bersrkarch.png -m fill"

  # Start the `ags` shell
  "ags"

  # Apps opened on hyprland launch
  "vesktop"
  "spotify"
]