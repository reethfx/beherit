{ pkgs, ... }:

{
  #AGS
  home.file.".config/ags".source = ../../dotfiles/ags;

  #Btop Themes
  home.file.".config/btop/themes".source = ../../dotfiles/btop/themes;

  #Wallpaper
  home.file.".config/wallpaper/".source = ../../dotfiles/wallpaper;

  #Vesktop files
  home.file.".config/vesktop/settings.json".source = ../../dotfiles/vesktop/settings.json;
  home.file.".config/vesktop/themes/theme.css".source = ../../dotfiles/vesktop/themes/theme.css;

  # Scripting symlink for ~/.local/bin
  home.file.".local/bin/screenshot-to-clipboard".source = ../../scripts/screenshot-to-clipboard.sh;
  home.file.".local/bin/select-area-screenshot-to-clipboard".source = ../../scripts/select-area-screenshot-to-clipboard.sh;
  home.file.".local/bin/screenshot".source = ../../scripts/screenshot.sh;
  home.file.".local/bin/select-area-screenshot".source = ../../scripts/select-area-screenshot.sh;
  home.file.".local/bin/system-notification".source = ../../scripts/system-notification.sh;


}
