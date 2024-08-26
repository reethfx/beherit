{ config, pkgs, ... }:

{
  programs.rustup.enable = true;

  # Install additional rust components
  environment.systemPackages = with pkgs; [
    rust-analyzer
    rustfmt
    cargo
  ];
  
  # Set environment variables for Rust
  environment.variables = {
    CARGO_HOME = "$HOME/.cargo";
    RUSTUP_HOME = "$HOME/.rustup";
  };
}
