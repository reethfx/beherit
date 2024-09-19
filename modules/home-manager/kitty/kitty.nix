{pgks, ...}: {
    enable = true;
        extraConfig = ''
          include ./themes/mocha.conf

          # Font
          font_family      FiraCode Nerd Font Mono
          bold_font        auto
          italic_font      auto
          font_size        12.0

          # Cursor
          cursor_blink    yes
          cursor_shape    block

          # Transparency
          background_opacity  0.9

          # Padding
          padding_width 10

          # Vi_mode for nav
          enable_vi_mode yes
          scrollback_lines 5000

          window_border_width 1


          dynamic_background_opacity yes
        '';
}