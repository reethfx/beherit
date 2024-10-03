{ pkgs, ... }: {

  services.xserver = {
    enable = true;
    layout = "es"; 
    xkbOptions = "terminate:ctrl_alt_bksp";
    videoDrivers = [ "nvidia" ];
  };

  services.xserver.displayManager.gdm.enable = true; #Temp
  services.xserver.desktopManager.gnome.enable = true; #Temp
  services.xserver.xkb.options = "";

  services.xserver.xkb = {
    layout = "es";
    variant = "";
  };

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
    };
  };

  services.tailscale.enable = true;

    hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      vaapiVdpau
      libvdpau-va-gl
   ];
  };

}
