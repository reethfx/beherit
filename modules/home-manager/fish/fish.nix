{ config, pkgs, lib, ... }: 

{
  enable = true;

  interactiveShellInit = "";

  shellAliases = {
    ls = "eza --icons";
    ll = "eza -l --icons --tree -l1";
    la = "eza -la --icons --tree -l1";
    cat = "bat";
    mkt = "mkdir {nmap,content,exploits,scripts}";
  };

  plugins = [
      { name = "tide"; src = pkgs.fishPlugins.tide.src; }
      { name = "grc"; src = pkgs.fishPlugins.grc.src; }
  ];
}
