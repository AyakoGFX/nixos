{ config, pkgs, lib, ... }:
{
  programs.niri.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  environment.systemPackages = with pkgs; [
    waybar
    # hyprpolkitagent # Polkit
    networkmanagerapplet
    wlogout
    # hyprlock
    # hypridle
    waypaper # wallpaper manager needs a backend ( swww, swaybg, feh, wallutils, hyprpaper, mpvpaper)
    swaybg
    pywal16
    imagemagick

    kitty
    alacritty
    nautilus
    btop
    (flameshot.override { enableWlrSupport = true; })
    brightnessctl
    xwayland-satellite
    fuzzel
    normcap
    swaynotificationcenter
    grim # Normcap dependency
    eog
    copyq

    nwg-look
    libsForQt5.qt5ct
    kdePackages.qtstyleplugin-kvantum
    libsForQt5.qtstyleplugin-kvantum
    papirus-icon-theme              #cd $(nix build nixpkgs#papirus-icon-theme --print-out-paths --no-link)
    gnome-themes-extra
    adwaita-icon-theme  ];

 # Optional, hint Electron apps to use Wayland:
environment = {
  sessionVariables = {
    NIXOS_OZONE_WL = "1";
    GTK_THEME = "Adwaita-dark"; # Default GTK theme
  };
  variables = {
    QT_QPA_PLATFORM = "wayland";
  };
};



}
# sudo find /nix/store -type d -iname "adwaita-dark"
