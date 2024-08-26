{
  description = "Beherit Dotfiles by reeth";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    home-manager.url = "github:nix-community/home-manager";
    
    ags.url = "github:Aylur/ags";

    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { self, nixpkgs, home-manager, ags, hyprland, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        nixosConfigurations.beherit = pkgs.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./modules/home-manager.nix
          ];
        };
      });
}
