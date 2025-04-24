{ config, pkgs, lib, ... }:

{
  virtualisation.waydroid.enable = true;
  # virtualisation.anbox.enable = true;
  environment.systemPackages = with pkgs; [
    # waydroid
  ];
}

# https://nixos.wiki/wiki/WayDroid
