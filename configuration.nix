{ config, pkgs, lib, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/boot.nix
    ./modules/defaults-apps.nix
    ./modules/desktop.nix
    ./modules/xdg-environment.nix
    ./modules/fonts.nix
    ./modules/hardware.nix
    ./modules/localization.nix
    ./modules/networking.nix
    ./modules/packages.nix
    ./modules/power-management.nix # off this when Enable gnome and kde
    ./modules/programs.nix
    ./modules/security.nix
    ./modules/services.nix
    ./modules/sound.nix
    ./modules/touchpad.nix
    ./modules/users.nix
    ./modules/vm.nix
    ./modules/emacs.nix
    # ./modules/python.nix
    # ./modules/ollama.ni
    # ./modules/pci.nix
  ];

  # Enabling flakes https://youtu.be/JCeYq72Sko0?si=jdGzJkFafMditbjy
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
  mkdir -p /home/ayako/dev
  mkdir -p /home/ayako/tmp
  mkdir -p /home/ayako/nega
'';

  # programs.home-manager.enable = true;

  # System State Version
  system.stateVersion = "24.11";
}
