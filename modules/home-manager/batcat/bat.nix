{ pkgs, ... }:{
    enable = true;
    themes = {
        catppuccinMocha =  {
            src = pkgs.fetchFromGitHub {
            owner = "catppuccin";
            repo = "catppuccin/bat";
            rev = "main";
            sha256 = "1g73x0p8pbzb8d1g1x1fwhwf05sj3nzhbhb65811752p5178fh5k";
            };
        };
    };
}

