{ config, pkgs, lib, ... }:
# TODO
# super + w
	# brightnessctl set 5%+ 
# super + s
	# brightnessctl set 5%-

{
  programs.hyprland.enable = true; # enable Hyprland
  # Optional, hint Electron apps to use Wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  services.displayManager.sddm.enable = true;
  environment.systemPackages = with pkgs; [
    kitty
    alacritty
    brightnessctl
    rofi
    sxhkd
    normcap
    grim # Normcap dependency
    polkit_gnome
    eog
    copyq

    nwg-look
    libsForQt5.qt5ct
    kdePackages.qtstyleplugin-kvantum
    libsForQt5.qtstyleplugin-kvantum
    arc-theme
    arc-kde-theme
    papirus-icon-theme
    arc-icon-theme
  ];
  
}
