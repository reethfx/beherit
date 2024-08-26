{ pkgs, config, ... }: {
  imports = [
    ./shell/fish.nix
    ./shell/starship.nix
    ./dev/rust/rust.nix
    ./dev/dotnet/dotnet.nix
    ./dev/nodejs/nodejs.nix
    ./tofi.nix
    ./exec-once.nix
    ./packages.nix
    ./firefox/default.nix
    ./hyprland/default.nix
    ];
}