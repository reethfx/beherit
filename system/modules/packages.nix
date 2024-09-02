{  pkgs, lib, inputs, ... }:
{
  # Install firefox.
  programs.firefox.enable = true;
  
  #Hyprland declaration
 #programs.hyprland.enable = true;
#  programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     wget
     vim
     git
     vscode
     inputs.nixpkgs.legacyPackages.${pkgs.system}.neovim
  ];
}