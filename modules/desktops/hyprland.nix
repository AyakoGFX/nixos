{ config, pkgs, lib, ... }:


{
  programs.hyprland.enable = true; # enable Hyprland
  # services.displayManager.sddm.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  environment.systemPackages = with pkgs; [
    # Hypr Ecosystem
    waybar
    hyprshot
    hyprpicker
    wl-clipboard
    wl-kbptr
    wl-screenrec
    slurp
    wluma #  Automatically adjust screen brightness based on the screen contents and amount of ambient light
    kando # https://kando.menu/installation-on-linux/#-hyprland
    xdg-user-dirs
    # hyprlandPlugins.hyprscroller
    hyprpolkitagent # Polkit
    networkmanagerapplet
    swayosd
    wlogout
    hyprlock
    hypridle
    waypaper # wallpaper manager needs a backend ( swww, swaybg, feh, wallutils, hyprpaper, mpvpaper)
    swaybg
    pywal16
    imagemagick
    
    # Notification 
    swaynotificationcenter
    libnotify


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
    QT_SCREEN_SCALE_FACTORS = "1.25";
  };
  variables = {
    QT_QPA_PLATFORM = "wayland";
    NIX_SKIP_BUILD_FROM_SOURCE = "1";
  };
};

}
# sudo find /nix/store -type d -iname "adwaita-dark"

# https://github.com/maximbaz/wluma
# Usage

# Simply launch wluma and continue adjusting your screen brightness as you usually do - the app will learn your preferences.

# wluma will not do anything on the first launch! You have to adjust the brightness by hand a few times, in different environment and/or with different screen contents, that way wluma will learn your preferences and only then it will begin to automatically change your screen brightness for you.
