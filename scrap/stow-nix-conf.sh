#!/usr/bin/env bash

# Get the current directory
CURRENT_DIR=$(pwd)

# Check if the files already exist in /etc/nixos/ and rename them with a .bak extension if they do
if [[ -f /etc/nixos/configuration.nix ]]; then
    mv /etc/nixos/configuration.nix /etc/nixos/configuration.nix.bak
    echo "Renamed existing /etc/nixos/configuration.nix to /etc/nixos/configuration.nix.bak"
fi

if [[ -f /etc/nixos/hardware-configuration.nix ]]; then
    mv /etc/nixos/hardware-configuration.nix /etc/nixos/hardware-configuration.nix.bak
    echo "Renamed existing /etc/nixos/hardware-configuration.nix to /etc/nixos/hardware-configuration.nix.bak"
fi

# Create symbolic links for configuration.nix and hardware-configuration.nix
sudo ln -sf "$CURRENT_DIR/configuration.nix" /etc/nixos/configuration.nix
sudo ln -sf "$CURRENT_DIR/hardware-configuration.nix" /etc/nixos/hardware-configuration.nix

echo "Symlinks created for configuration.nix and hardware-configuration.nix."

