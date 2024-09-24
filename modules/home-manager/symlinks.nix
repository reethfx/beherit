{ pkgs, ... }:

{
  home.file.".config/ags".source = ../../dotfiles/ags;
  home.file.".config/btop/themes".source = ../../dotfiles/btop/themes;

  home.file.".config/wallpaper/".source = ../../dotfiles/wallpaper;

  home.file.".config/vesktop/settings.json".source = ../../dotfiles/vesktop/settings.json;
  home.file.".config/vesktop/themes/theme.css".source = ../../dotfiles/vesktop/themes/theme.css;
}
