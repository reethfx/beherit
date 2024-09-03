{
  description = "Beherit NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    ags.url = "github:Aylur/ags";

  };

  outputs = { self, nixpkgs, home-manager, hyprland, ags, ... } @inputs: 
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };

  in
    {
      nixosConfigurations = {
        beherit = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs system; };
          modules = [ ./system/configuration.nix ];
        };
      };

      homeConfigurations = {
        "reeth@beherit" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          system = "x86_64-linux";
          configuration = { config, lib, pkgs, ... }: {
            modules = [
              {
                home.username = "reeth";
                home.stateVersion = "24.11";
                home.homeDirectory = "/home/reeth";
                programs.home-manager.enable = true;
                wayland.windowManager.hyprland.enable = true;
	            }
            ];

            home.packages = with pkgs; [
             hyprland
              xdg-desktop-portal-gtk
              xdg-desktop-portal-hyprland
            ];
          };
        };
      };
    };
}
