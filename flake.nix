{
  description = "Beherit dotfiles for NixOS by reeth";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
   
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { nixpkgs, ... } @ inputs: 
  {
  
    nixosConfigurations.beherit = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
         ./system/configuration.nix
      ];
    };
    
#    homeConfigurations."reeth" = home-manager.lib.homeManagerConfiguration {
#      inherit pkgs;
#    
#      modules = [ ./home/home.nix ];
#    }; 
  };
}
