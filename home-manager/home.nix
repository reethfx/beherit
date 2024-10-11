{  inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ../modules/home-manager/symlinks.nix #Symlinks refered to certain config files

    ../modules/home-manager/nvim/nvim.nix
    ../modules/home-manager/spicetify/spicetify.nix
    ../modules/home-manager/hyprlock/hyprlock.nix
    ../modules/home-manager/zathura/zathura.nix
  ];

  nixpkgs = {
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
    fishPlugins.tide
    starship
    kitty
    tofi
    hyprpicker
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
    vscode
    swaybg
    hyprlock
    fastfetch
    imagemagick
    autorandr
    nil
    hyprpicker
    dunst
    obsidian
    freerdp
    gammastep

    
    # Programming langs
    rustup
    gcc
    dotnet-sdk
    nodejs
    python3
 ];

  # Programs to be enabled
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "reethfx";
    userEmail = "reethb3rsrk@gmail.com";
  };

  programs.fastfetch.enable = true;

  programs.btop = {
  enable = true;
  settings = {
    color_theme = "theme.theme";
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
      "text/html" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/about" = "firefox.desktop";
      "x-scheme-handler/unknown" = "firefox.desktop";

      "image/jpeg" = "qimgv.desktop";
      "image/png" = "qimgv.desktop";
    };
  };

  xdg.desktopEntries.firefox-developer-edition = {
    name = "Firefox Developer Edition";
    genericName = "Web Browser";
    exec = "firefox-developer-edition --profile ${config.home.homeDirectory}/.mozilla/firefox/reeth/ %U";
    terminal = false;
    categories = ["Application" "Network" "WebBrowser"];
    mimeType = ["text/html" "text/xml"];
  };

  programs.ags.enable = true;

  wayland.windowManager.hyprland = import ../modules/home-manager/hyprland/default.nix { inherit pkgs config; };
  programs.starship = import ../modules/home-manager/starship/default.nix { inherit pkgs config lib; };
  programs.firefox = import ../modules/home-manager/firefox/default.nix { inherit pkgs config lib inputs; };
  programs.tofi = import ../modules/home-manager/tofi/default.nix { inherit pkgs config lib; };
  programs.kitty = import ../modules/home-manager/kitty/kitty.nix { inherit pkgs config lib; };
  programs.fish = import ../modules/home-manager/fish/fish.nix { inherit pkgs config lib; };
  programs.bat = import ../modules/home-manager/batcat/bat.nix { inherit pkgs config lib; };


  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
