{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    
    ags.url = "github:Aylur/ags";
  };

  outputs = { home-manager, nixpkgs, ... } @inputs:
  let
    username = "reeth";
    hostname = "beherit";
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };

  in
  {
    nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs username system hostname; };
      modules = [ 
        ./system/configuration.nix
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.${username} = import ./home/home.nix;
          home-manager.backupFileExtension = "backup";
          home-manager.extraSpecialArgs = {inherit inputs username hostname; };
        }
      ];
    };
  };
}