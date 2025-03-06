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
    waypaper # wallpaper manager needs a backend ( swww, swaybg, feh, wallutils, hyprpaper, mpvpaper)
    swww

    kitty
    nautilus
    btop
    # flameshot
    (flameshot.override { enableWlrSupport = true; })
    alacritty
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
    arc-theme                       #cd $(nix build nixpkgs#arc-theme --print-out-paths --no-link)
    papirus-icon-theme              #cd $(nix build nixpkgs#papirus-icon-theme --print-out-paths --no-link)
    arc-kde-theme
    arc-icon-theme
    adwaita-icon-theme
  ];

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
