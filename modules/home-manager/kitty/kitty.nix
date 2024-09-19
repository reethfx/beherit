{
    enable = true;
        extraConfig = ''
      include ${catppuccin}/themes/mocha.conf

      # Fuente
      font_family      FiraCode Nerd Font Mono
      bold_font        auto
      italic_font      auto
      font_size        14.0

      # Apariencia del cursor y bordes
      cursor          beam
      cursor_blink    yes
      cursor_shape    block

      # Transparencia
      background_opacity  0.9

      # Padding (relleno)
      padding_width 5

      # Habilitar vi-mode para navegación
      enable_vi_mode yes

      # Bordes en las ventanas de Kitty
      window_border_width 2

      # Opciones de desplazamiento
      scrollback_lines 5000

      # Opciones adicionales para mejorar el rendimiento visual
      dynamic_background_opacity yes
    '';
}