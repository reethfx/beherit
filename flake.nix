{
  description = "Beherit configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
  };

  outputs = { self, nixpkgs, home-manager, hyprland, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        system = system;
      };
    in {
      nixosConfigurations = {
        beherit = nixpkgs.lib.nixosSystem {
          system = system;
          # specialArgs = { inherit inputs; };
          modules = [
            ./system/configuration.nix
            home-manager.nixosModules.home-manager
          ];
        };
      };

      # Configuración de Home-Manager para tu usuario
      homeConfigurations = {
        reeth = home-manager.lib.homeManagerConfiguration {
          pkgs = pkgs;
          modules = [ ./home/home.nix ];
        };
      };
    };
}
