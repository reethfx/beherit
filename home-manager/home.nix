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

    # Enable fish as the default shell
    # programs.fish.enable = true;

    home.packages = with pkgs; [
    fish
    starship
    neovim #FIXME Add your desired text editor
    tofi
    wezterm
    kitty
  ];

 programs.starship = {
    enable = true;
  };

  # TODO: Set your username amd home dir.
  home = {
    username = "reeth";
    homeDirectory = "/home/reeth";
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  # home.packages = with pkgs; [ steam ];

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;

  # wayland.windowManager.hyprland = import ../modules/home-manager/hyprland/default.nix { inherit pkgs config; };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
