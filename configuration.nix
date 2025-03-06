{ config, pkgs, lib, ... }:


{
  imports = [
    ./hardware-configuration.nix
    ./modules/boot.nix
    ./modules/defaults-apps.nix
    ./modules/desktop.nix
    ./modules/environment.nix
    ./modules/fonts.nix
    ./modules/hardware.nix
    ./modules/localization.nix
    ./modules/networking.nix
    ./modules/packages.nix
    ./modules/power-management.nix
    ./modules/programs.nix
    ./modules/security.nix
    ./modules/services.nix
    ./modules/sound.nix
    ./modules/touchpad.nix
    ./modules/users.nix
    ./modules/vm.nix
    ./modules/emacs.nix
    # ./modules/ollama.ni
    # ./modules/pci.nix
    # ./modules/python.nixx
  ];

  # Enabling flakes https://youtu.be/JCeYq72Sko0?si=jdGzJkFafMditbjy
  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
  };

  # programs.home-manager.enable = true;

  # System State Version
  system.stateVersion = "24.11";
}
