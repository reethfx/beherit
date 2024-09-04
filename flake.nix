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

  outputs = { self, nixpkgs, home-manager, hyprland, ... }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  in
    {
      nixosConfigurations = {
        beherit = nixpkgs.lib.nixosSystem {
          modules = [ 
            ./system/configuration.nix 
            home-manager.nixosModules.home-manager
            {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.reeth = import ./home/home.nix;

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
            }
            ];
        };
      };
   };
}
