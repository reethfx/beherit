{ pkgs, lib, config, ... }:

{
  #AGS
  home.file.".config/ags".source = ../../dotfiles/ags;

  #Btop Themes
  home.file.".config/btop/themes".source = ../../dotfiles/btop/themes;

  #Wallpaper
  home.file.".config/wallpaper/".source = ../../dotfiles/wallpaper;
  home.file.".config/media/".source = ../../media;

  #Vesktop files
  home.file.".config/vesktop/settings.json".source = ../../dotfiles/vesktop/settings.json;
  home.file.".config/vesktop/themes/theme.css".source = ../../dotfiles/vesktop/themes/theme.css;

  #Kitty themes
  home.file.".config/kitty/themes/mocha.conf".source = ./kitty/themes/mocha.conf;
  
  #Fastfetch file
  home.file.".config/fastfetch/config.jsonc".source = ../../dotfiles/fastfetch/config.jsonc;

  #Notification image display
  home.file.".config/hypr/pictures/beherit.png".source = ../../media/beherit.png;

  #Nvim
  # home.file.".config/nvim/lua".source = ./nvim/lua;

  # Scripting file coppy for ~/.local/bin
  home.activation.installScripts = lib.mkAfter ''
    cp -R ${config.home.homeDirectory}/Projects/beherit/scripts/* ~/.local/bin
    chmod -R +x ~/.local/bin/*
  '';
}
