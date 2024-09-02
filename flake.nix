{
  description = "Beherit dotfiles for NixOS by reeth";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
   
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { nixpkgs, home-manager, hyprland, ... } @ inputs: {

    nixosConfigurations.beherit = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
         ./system/configuration.nix
      ];
    };

    homeConfigurations.reeth = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs {
        system = "x86_64-linux";  # Ajusta según tu arquitectura
        overlays = [ (self: super: {
          hyprland = inputs.hyprland.packages.${super.system}.hyprland;
        }) ];
      };

      homeDirectory = "/home/reeth";
      modules = [
        ./home/home.nix
        {
          programs.hyprland = {
            enable = true;
          };
        }
      ];
    };
  };
}
