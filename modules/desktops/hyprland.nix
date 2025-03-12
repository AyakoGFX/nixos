{ config, pkgs, lib, ... }:


{
  programs.hyprland.enable = true; # enable Hyprland
  # services.displayManager.sddm.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  environment.systemPackages = with pkgs; [
    # Hypr Ecosystem
    waybar
    hyprpolkitagent # Polkit
    networkmanagerapplet
    wlogout
    hyprlock
    hypridle
    waypaper # wallpaper manager needs a backend ( swww, swaybg, feh, wallutils, hyprpaper, mpvpaper)
    swww
    swaybg
    pywal16
    imagemagick

    kitty
    alacritty
    nautilus
    btop
    (flameshot.override { enableWlrSupport = true; })
    brightnessctl
    rofi
    normcap
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
