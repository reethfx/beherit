{ config, pkgs, ... }: 

{
  enable = true;
  plugins = [
      { name = "tide"; src = pkgs.fishPlugins.tide.src; }
  ];
}
