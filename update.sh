#!/usr/bin/env bash
sudo nixos-rebuild switch --upgrade -I nixos-config=/home/$USER/nixos/configuration.nix
