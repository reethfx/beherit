{ config, pkgs, lib, ... }: 

{
  enable = true;

    interactiveShellInit = ''
      set -g fish_greeting ""
    '';

  shellAliases = {
    ls = "eza --icons";
    ll = "eza -l --icons --tree -L2";
    la = "eza -la --icons --tree -L2";
    cat = "bat";
    mkt = "mkdir {nmap,content,exploits,scripts}";
  };

  plugins = [
      { name = "tide"; src = pkgs.fishPlugins.tide.src; }
      # { name = "grc"; src = pkgs.fishPlugins.grc.src; }
  ];
}
