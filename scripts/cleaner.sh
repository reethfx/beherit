#! /bin/sh

nix-store --gc
sudo nix-collect-garbage -d
nix-collect-garbage -d
nix-store --optimise
sudo rm -f /run/booted-system
sudo nix-collect-garbage