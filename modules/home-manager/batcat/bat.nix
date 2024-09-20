{ pkgs, ... }:{
    enable = true;

    themes = {
        catpuccin = {
            src = pkgs.fetchFromGitHub {
            owner = "catppuccin";
            repo = "sublime"; # Bat uses sublime syntax for its themes
            rev = "main";
            sha256 = "1g73x0p8pbzb8d1g1x1fwhwf05sj3nzhbhb65811752p5178fh5k";
            };
            file = "themes/Catppuccin-mocha.tmTheme";
        };
    };
}

