{
  description = "Beherit's NixOS dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
    ags.url = "github:Aylur/ags";
  };

  outputs = { self, nixpkgs, home-manager, hyprland, ags, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations.reeth = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./modules/home.nix
          hyprland.homeManagerModules.default
          {
            home.packages = [ ags.packages.${system}.default ];
          }
        ];
      };
    };
}
