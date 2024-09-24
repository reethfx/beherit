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

  
}
