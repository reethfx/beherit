{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
  };

  outputs = { nixpkgs, home-manager, hyprland, ... }: let
    system = "x86_64-linux";
  in {
    nixosConfigurations.yourhostname = nixpkgs.lib.nixosSystem {
      system = system;
      modules = [
        ./system/configuration.nix
      ];
    };

    homeConfigurations."reeth@beherit" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};

      modules = [
        ./home/home.nix
      ];
    };
  };
}