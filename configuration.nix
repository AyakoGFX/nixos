{ config, pkgs, lib, ... }:

# let
#   let
#   home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz";
# in

# /home/ayako/nixos/scrap/home.nix

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
    ./modules/localization.nix
    ./modules/networking.nix
    ./modules/packages.nix
    ./modules/opentabletdriver.nix
    # ./modules/power-management.nix # off this when Enable gnome and kde
    ./modules/programs.nix
    ./modules/security.nix
    ./modules/services.nix
    ./modules/sound.nix
    ./modules/touchpad.nix
    ./modules/users.nix
    ./modules/vm.nix
    ./modules/emacs.nix
    ./modules/games.nix
    # ./modules/nixos-unstable.nix
    # ./modules/ps2-games.nix
    # ./modules/android.nix TODO
    # ./modules/droidcam.nix
    # ./modules/hacker.nix TODO
    ./modules/python.nix
    # ./modules/ollama.nix
    # ./modules/pci.nix
  ];

  # home-manager.useUserPackages = true;
  # home-manager.useGlobalPkgs = true;
  # home-manager.backupFileExtension = "backup";
  # home-manager.users.ayako = import ./home.nix;

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

  ];

  # programs.home-manager.enable = true;

  # System State Version
  system.stateVersion = "25.05";
}
