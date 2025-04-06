#!/usr/bin/env bash
sudo nixos-rebuild switch --flake .#nixos -I nixos-config=/home/$USER/nixos/configuration.nix
