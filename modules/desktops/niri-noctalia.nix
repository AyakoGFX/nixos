{ config, pkgs, lib, inputs, ... }:
{
  programs.niri.enable = true;
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
  services.displayManager.gdm.enable = true;
  # hardware.bluetooth.enable this is enabled in the ./modules/hardware.nix

  environment.systemPackages = with pkgs; [
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    networkmanagerapplet
    imagemagick
    kitty
    alacritty
    nautilus
    btop
    brightnessctl
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
