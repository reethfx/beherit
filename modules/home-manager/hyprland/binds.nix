{
  bind = [
    # Exit binds
    "$mod, Q, killactive"
    "$mod SHIFT, Q, exit"

    # Move focus
    "CTRL, LEFT, movefocus, l"
    "CTRL, RIGHT, movefocus, r"
    "CTRL, UP, movefocus, u"
    "CTRL, DOWN, movefocus, d"

    # Switch to workspace
    "$mod, 1, workspace, 1"
    "$mod, 2, workspace, 2"
    "$mod, 3, workspace, 3"
    "$mod, 4, workspace, 4"
    "$mod, 5, workspace, 5"
    "$mod, 6, workspace, 6"

    # Move window to workspace
    "$mod SHIFT, 1, movetoworkspace, 1"
    "$mod SHIFT, 2, movetoworkspace, 2"
    "$mod SHIFT, 3, movetoworkspace, 3"
    "$mod SHIFT, 4, movetoworkspace, 4"
    "$mod SHIFT, 5, movetoworkspace, 5"
    "$mod SHIFT, 6, movetoworkspace, 6"

    "$mod, LEFT, exec, hyprctl dispatch focuswindow left"
    "$mod, RIGHT, exec, hyprctl dispatch focuswindow right"
    "$mod, UP, exec, hyprctl dispatch focuswindow up"
    "$mod, DOWN, exec, hyprctl dispatch focuswindow down"


    # Floating wqindows
    "$mod, X, togglefloating"

    # Toggle fullscreen
    "$mod, M, fullscreen, 0"
    "$mod SHIFT, M, fullscreen, 1"

    # Screenshots
    "$mod, S, exec, ~/.local/bin/screenshot.sh"
    "$mod SHIFT, S, exec, ~/.local/bin/select-area-screenshot-to-clipboard.sh"
    "$mod CONTROL SHIFT, S, exec, ~/.local/bin/select-area-screenshot.sh"
    "$mod, F10, exec, ~/.local/bin/toggle-touchpad.sh"

    # Clipboard history manager
    "$mod, V, exec, cliphist list | sed 's/^[0-9]*\\t//g' | tofi --placeholder-text='Clipboard...' | cliphist decode | wl-copy"

    # App shortcuts
    "$mod, RETURN, exec, starship init fish | kitty"
    "$mod, F, exec, firefox"
    "$mod, D, exec, eval $(tofi-drun)"
    "$mod, C, exec, hyprpicker -a"
    "$mod, L, exec, hyprlock"
  ];

  bindm = [
    # Floating windows mouse control
    "$mod, mouse:272, movewindow"
    "$mod, mouse:273, resizewindow"
  ];
}
