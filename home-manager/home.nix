# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{  inputs, outputs, lib, config, pkgs, ... }:
{
  # You can import other home-manager modules here
  imports = [
    # ./nvim.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      allowUnfree = true;
    };
  };

  # TODO: Set your username amd home dir.
  home = {
    username = "reeth";
    homeDirectory = "/home/reeth";
  };

  #FIXME Define your desired packages here
    home.packages = with pkgs; [ 
    fish
    starship
    kitty
    neovim #FIXME Add your desired text editor
    tofi
    hyprpicker
    wl-clipboard
    spotify
    vesktop
    firefox
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    pavucontrol
    xdg-utils
    qimgv
    sshfs
    keepass
  ];

  # Programs to be enabled
  programs.home-manager.enable = true;

  programs.git.enable = true;

  programs.btop = {
  enable = true;
  settings = {
    color_theme = ../dotfiles/btop/themes/theme.theme;
    vim_keys = true;
    };
  };

  stylix = {
    base16Scheme = ../dotfiles/stylix/theme.yaml;
    autoEnable = false;
    targets.gtk.enable = true;
    targets.firefox.enable = true;
    targets.firefox.profileNames = ["reeth"];
  };

  gtk = {
    enable = true;
    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = 24;
    };
  };

  home.pointerCursor = {
    name = "Bibata-Modern-Classic";
    package = pkgs.bibata-cursors;
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  xdg.enable = true;

  xdg.mime.enable = true;
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "firefox-developer-edition.desktop";
      "x-scheme-handler/http" = "firefox-developer-edition.desktop";
      "x-scheme-handler/https" = "firefox-developer-edition.desktop";
      "x-scheme-handler/about" = "firefox-developer-edition.desktop";
      "x-scheme-handler/unknown" = "firefox-developer-edition.desktop";

      "image/jpeg" = "qimgv.desktop";
      "image/png" = "qimgv.desktop";
    };
  };

  programs.ags.enable = true;

  wayland.windowManager.hyprland = import ../modules/home-manager/hyprland/default.nix { inherit pkgs config; };
  programs.starship = import ../modules/home-manager/starship/default.nix { inherit pkgs config lib; };
  programs.firefox = import ../modules/home-manager/firefox/default.nix { inherit pkgs config lib; };
  programs.tofi = import ../modules/home-manager/tofi/default.nix { inherit pkgs config lib; };
  programs.kitty = import ../modules/home-manager/kitty/kitty.nix { inherit pkgs config lib; };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
