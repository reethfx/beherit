{
  services.xserver.enable = true;
  services.xserver.layout = "es";

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

}
