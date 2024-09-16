{ pkgs, config, ... }:
{
  enable = true;
  systemd.enable = true;
  xwayland.enable = true;

  settings = {
    "$mod" = "SUPER";
    #"$scripts_path" = "${config.home.homeDirectory}/.nix-profile/bin";

    input =
      {
        kb_layout = "es";
        kb_options = "caps:escape";

        numlock_by_default = true;
        accel_profile = "flat";
        force_no_accel = true;
      }
      // import ./binds.nix;

    env = import ./env.nix;

    monitor = [
      "DP-3, 1920x1080@240, 0x0, 1"

      # Fake monitor bug caused by Nvidia, need to be disable or it will crash when
      # you move around workspaces
      "Unknown-1, disable"
    ];

    exec-once = import ./exec-once.nix {inherit config;};

    general = {
      layout = "dwindle";
      gaps_in = 3;
      gaps_out = 6;
      border_size = 4;
      "col.active_border" = "rgb(be95ff)";
      "col.inactive_border" = "rgb(161616)";
    };

    decoration = {
      rounding = 8;
      drop_shadow = false;
    };

    dwindle = {
      preserve_split = true;
      pseudotile = true;
    };

    cursor = {
      inactive_timeout = 5;
    };

    windowrulev2 = import ./window-rules.nix;
  };
}