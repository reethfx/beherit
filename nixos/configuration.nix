{ inputs, outputs, lib, config, pkgs, ... }: 
{
  imports = [
    ./hardware-configuration.nix
    ../modules/nixos/locale.nix
    ../modules/nixos/programs.nix
    ../modules/nixos/services.nix
    ../modules/nixos/sys-pkgs.nix
    ../modules/nixos/user.nix
  ];

  #Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
    overlays = [
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
  };

  nix = let
    flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  in {
    settings = {
      experimental-features = "nix-command flakes";
      flake-registry = "";
      nix-path = config.nix.nixPath;
    };
    channel.enable = false;

    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
  };
  
  hardware.nvidia = {
    package = pkgs.nvidiaPackages.stable;  # Usa el driver propietario
    modesetting.enable = true;  # Habilitar modesetting para NVIDIA
  };

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  system.stateVersion = "24.05"; #FIXME set it up to the actual version of NixOS
}
