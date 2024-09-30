{ inputs, outputs, lib, config, pkgs, ... }: 
{
  environment.systemPackages = with pkgs; [
    jetbrains-mono
      (nerdfonts.override {
        fonts = [
          "NerdFontsSymbolsOnly"
        ];
    })
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
    btop
    bat
    sway
    swaylock
    grim
    slurp
    wl-clipboard
    vulkan-tools
    mesa
    libvdpau-va-gl
    vaapiVdpau
  ];
}