{ config, pkgs, inputs, ... }:

{
  imports = [
    (import ./bootloader.nix { inherit config pkgs inputs; })
    (import ./locale.nix { inherit config pkgs inputs; })
    (import ./networking.nix { inherit config pkgs inputs; })
    (import ./packages.nix { inherit config pkgs inputs; })
    (import ./pipewire.nix { inherit config pkgs inputs; })
    (import ./services.nix { inherit config pkgs inputs; })
    (import ./user.nix { inherit config pkgs inputs; })
  ];
}
