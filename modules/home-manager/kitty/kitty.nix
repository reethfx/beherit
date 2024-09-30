{ pkgs, ... }: {
    enable = true;
        extraConfig = ''
          include ./themes/mocha.conf

          # Font
          font_family      Fira Code Nerd Font Mono
          bold_font        auto
          italic_font      auto
          font_size        12.0

          # Cursor
          cursor_blink    yes
          cursor_shape    beam

          # Transparency
          background_opacity  0.9

          # Padding
          window_padding_width 10

          # Vi_mode for nav
          enable_vi_mode yes
          scrollback_lines 5000

          window_border_width 1
          
          confirm_os_window_close 0
          dynamic_background_opacity yes
          enable_csi_u_key_encoding yes

          # --[ tabs ] --------------------------------------------------------------- {{{
          
          tab_bar_style                   custom
          tab_separator                   ""
          tab_bar_margin_width            0                   
          tab_fade                        0 0 0 0
          tab_bar_edge                    slanted
          tab_max_width                   20
          tab_min_width                   10
          tab_activity_symbol             none
          tab_bar_align                   left
          active_tab_title_template       "{fmt.fg._eff1f5}{fmt.bg._d20f39}  {index}:{f'{title[:6]}…{title[-6:]}' if title.rindex(title[-1]) + 1 > 25 else title}{' []' if layout_name == 'stack' else ' ' } "
          tab_title_template              "{fmt.fg._9ca0b0}{fmt.bg._7c7f93}  {index}:{f'{title[:6]}…{title[-6:]}' if title.rindex(title[-1]) + 1 > 25 else title}{' []' if layout_name == 'stack' else ' ' }"
          tab_bar_margin_width            0.0
          active_tab_font_style           bold
          inactive_tab_font_style         normal
          tab_activity_symbol             none
          bell_on_tab                     no
          #}}}

          '';
}
