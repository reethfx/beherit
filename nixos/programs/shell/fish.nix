{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    promptInit = ''
      starship init fish | source
    '';
  };

  # Set Fish as the default shell
  home.shell = pkgs.fish;
}
