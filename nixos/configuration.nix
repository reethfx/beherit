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
  
  boot.kernelPackages = pkgs.linuxPackages_6_1;
  boot.kernelModules = [ "nvidia-drm" ];

  hardware.cpu.amd.updateMicrocode = true; 
  
  hardware.nvidia = {
    modesetting.enable = true; 
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

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

  system.stateVersion = "24.05"; #FIXME set it up to the actual version of NixOS
}
