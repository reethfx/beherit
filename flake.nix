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

outputs = inputs@{ nixpkgs, home-manager, ... }: {
    nixosConfigurations.beherit = nixpkgs.lib.nixosSystem {
        modules = [
          ./system/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            # TODO replace reeth with your own username
            home-manager.users.reeth = import ./home/home.nix;
          }
        ];
      };
    };
  };
}