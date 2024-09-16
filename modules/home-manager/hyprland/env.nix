[
  # Hyprland settings
  "HYPRCURSOR_THEME, Bibata-Modern-Classic"
  "HYPRCURSOR_SIZE, 24"

  # GTK settings
  "GDK_BACKEND, wayland,x11,*"

  # QT settings
  "QT_QPA_PLATFORM, wayland;xcb"
  "XCURSOR_SIZE, 24"
  "T_QPA_PLATFORM, wayland"
  "XCURSOR_THEME, Bibata-Modern-Classic"

  # SDL2 settings
  # Some games may need to be set with SDL_VIDEODRIVER=x11
  # if they bundle an older non Wayland compatible SDL2 version
  "SDL_VIDEODRIVER, wayland"

  # Clutter settings
  "CLUTTER_BACKEND, wayland"

  # XDG settings
  "XDG_CURRENT_DESKTOP, Hyprland"
  "XDG_SESSION_TYPE, wayland"
  "XDG_SESSION_DESKTOP, Hyprland"

  # Electron settings
  "NIXOS_OZONE_WL, 1"

  # Nvidia settings
  "GBM_BACKEND, nvidia-drm"
  "__GLX_VENDOR_LIBRARY_NAME, nvidia"
  "LIBVA_DRIVER_NAME, nvidia"
  "__GL_GSYNC_ALLOWED, 1"
  "__GL_VRR_ALLOWED, 0"
  "WLR_DRM_NO_ATOMIC, 1"
]