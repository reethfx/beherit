{pkgs, ...}:
with pkgs; [
  vscode
  fish
  eza
  kitty
  jetbrains-mono
  (nerdfonts.override {
    fonts = [
      "NerdFontsSymbolsOnly"
    ];
  })
  glow
  nil
]