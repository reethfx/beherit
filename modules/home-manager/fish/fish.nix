{ config, pkgs, lib, ... }: 

{
  enable = true;

  shellAliases = {
    ls = "eza --icons";
    ll = "eza -l --icons --tree -L1";
    la = "eza -la --icons -L1";
  };

  plugins = [
      { name = "tide"; src = pkgs.fishPlugins.tide.src; }
      { name = "grc"; src = pkgs.fishPlugins.grc.src; }
  ];
}
