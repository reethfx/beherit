{config}: [
  "dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"

  # Start the clipboard daemon
  #"wl-paste --type text --watch cliphist store"
  #"wl-paste --type image --watch cliphist store"

  # Start the wallpaper manager
  #"swww-daemon"

  # Start the `ags` shell
  #"ags"

  # Apps with window rules that will be reverted
  #"vesktop"
  #"spotify"
  #"steam"
]