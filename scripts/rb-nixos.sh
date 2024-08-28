#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Run as root"
  exit
fi

echo "Cleaning and rebuilding NixOS system..."

echo "Cleaning up the system..."
nix-collect-garbage -d

echo "Rebuilding system..."
nixos-rebuild switch --flake .#beherit

echo "Process commplete."
