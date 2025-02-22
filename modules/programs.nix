{ config, pkgs, lib, ... }:

{
  programs = {
    nix-ld.enable = true;
    fish.enable = true;
    nm-applet.enable = true;
    firefox.enable = true;
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
      ];
    };
  };
}
