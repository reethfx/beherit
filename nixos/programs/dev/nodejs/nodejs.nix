{ config, pkgs, ... }:

{
  programs.nodejs.enable = true;
  environment.systemPackages = with pkgs; [
    nodejs
    npm
  ];

  # Set environment variables for Node.js
  environment.variables.NVM_DIR = "$HOME/.nvm";
}
