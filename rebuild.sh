#!/usr/bin/env bash
sudo nixos-rebuild switch --flake . -I nixos-config=/home/$USER/nixos/configuration.nix
