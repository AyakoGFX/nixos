{ config, pkgs, lib, ... }:

{
  services.displayManager.ly.enable = true;
  services.xserver = {
    enable = true;
    windowManager.awesome.enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
  };
  environment.systemPackages = with pkgs; [
    flameshot
    brightnessctl
    alacritty
    sxhkd
    picom
    nitrogen
    normcap
    polkit_gnome
    eog
    copyq


    lxappearance
    libsForQt5.qt5ct
    kdePackages.qtstyleplugin-kvantum
    libsForQt5.qtstyleplugin-kvantum
  ];

  environment.variables.SDL_VIDEODRIVER = "x11";
  programs = {
    thunar = {
      enable = true;
      plugins = with pkgs; [
        thunar-archive-plugin
        thunar-volman
      ];
    };
  };
}



