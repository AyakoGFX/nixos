{ config, pkgs, lib, ... }:

{
  services.xserver = {
    enable = true;
    displayManager.lightdm.enable = true;
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


    lxappearance
    libsForQt5.qt5ct
    kdePackages.qtstyleplugin-kvantum
    libsForQt5.qtstyleplugin-kvantum
  ];

  environment.variables.SDL_VIDEODRIVER = "x11";
  programs = {
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
      ];
    };
  };
}



