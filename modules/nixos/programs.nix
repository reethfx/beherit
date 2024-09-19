{
hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  programs.fish.enable = true;
  programs.starship.enable = true;

  programs.hyprland = {
    enable = true;

    config = {
      input = {
        kb_layout = "es";
      };
    };
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    # extraPortals = [pkgs.xdg-desktop-portal-hyprland pkgs.xdg-desktop-portal-gtk];
    config.common.default = "*";
  };

}