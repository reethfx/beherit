{ inputs, outputs, lib, config, pkgs, ... }: 
{
  environment.systemPackages = with pkgs; [
    jetbrains-mono
      (nerdfonts.override {
        fonts = [
          "NerdFontsSymbolsOnly"
        ];
    })
    neovim
    home-manager
    eza
    fish
    git
    curl
    wget
    swww
    hyprlock
    xss-lock
    firefox
    dunst
    grim
  ];
}