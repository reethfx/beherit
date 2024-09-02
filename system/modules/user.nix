{  pkgs, lib, inputs, ... }:

{
  users.users.reeth.isNormalUser =  true;

  home-manager.users.reeth = { pkgs, ... }: {
    home.packages = [ pkgs.atool pkgs.httpie ];
    programs.bash.enable = true;

    home.stateVersion = "24.05";
  };
}