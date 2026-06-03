{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    # (import "${home-manager}/nixos")
    ./modules/boot.nix
    ./modules/defaults-apps.nix
    ./modules/desktop.nix
    ./modules/xdg-environment.nix
    ./modules/fonts.nix
    ./modules/hardware.nix
    #    ./modules/localization.nix
    ./modules/networking.nix
    ./modules/packages.nix
    ./modules/opentabletdriver.nix
    # ./modules/power-management.nix # off this when Enable gnome and kde and niri
    ./modules/programs.nix
    ./modules/security.nix
    ./modules/services.nix
    ./modules/sound.nix
    ./modules/touchpad.nix
    ./modules/users.nix
    #    ./modules/vm.nix
    ./modules/emacs.nix
    #   ./modules/games.nix
    # ./modules/nixos-unstable.nix
    # ./modules/ps2-games.nix
    # ./modules/android.nix TODO
    # ./modules/droidcam.nix
    # ./modules/hacker.nix TODO
    #  ./modules/python.nix
    # ./modules/ollama.nix
    # ./modules/pci.nix
  ];

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
  };

  system.activationScripts.createPersonalDirs.text = ''
    mkdir -p /home/ayako/Desktop
  mkdir -p /home/ayako/Download
  mkdir -p /home/ayako/Templates
  mkdir -p /home/ayako/Publicshare
  mkdir -p /home/ayako/Documents
  mkdir -p /home/ayako/Music
  mkdir -p /home/ayako/Pictures/Screenshots
  mkdir -p /home/ayako/Videos
  mkdir -p /home/ayako/Videos/Record/
  mkdir -p /home/ayako/Videos/Record/{Monitor,Region}
  mkdir -p /home/ayako/.local/share/fonts
  mkdir -p /home/ayako/.local/share/bin
  mkdir -p /home/ayako/dev
  mkdir -p /home/ayako/tmp
  mkdir -p /home/ayako/Books
  mkdir -p /home/ayako/Books/{Essays,Theses,Reports,Papers}
  chown -R ayako:users /home/ayako
  '';

  nixpkgs.config.permittedInsecurePackages = [
    "libsoup-2.74.3"
    "electron-39.8.10"

  ];
  time.timeZone = "Asia/Kolkata";

  i18n = {
    defaultLocale = "en_US.UTF-8";

    extraLocaleSettings = {
      LC_ADDRESS        = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT    = "en_US.UTF-8";
      LC_MONETARY       = "en_US.UTF-8";
      LC_NAME           = "en_US.UTF-8";
      LC_NUMERIC        = "en_US.UTF-8";
      LC_PAPER          = "en_US.UTF-8";
      LC_TELEPHONE      = "en_US.UTF-8";
      LC_TIME           = "en_US.UTF-8";
    };
  };

  # System State Version
  system.stateVersion = "26.05";
}
