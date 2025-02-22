{ config, pkgs, lib, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/boot.nix
    ./modules/environment.nix
    ./modules/hardware.nix
    ./modules/localization.nix
    ./modules/networking.nix
    ./modules/packages.nix
    ./modules/programs.nix
    ./modules/fonts.nix
    ./modules/power-management.nix
    ./modules/security.nix
    ./modules/services.nix
    ./modules/sound.nix
    ./modules/users.nix
    ./modules/python.nix
    ./modules/vm.nix
    ./modules/desktop.nix
    ./modules/defaults-apps.nix
    # ./modules/pci.nix
    # ./modules/ollama.nix
  ];

  # Enabling flakes https://youtu.be/JCeYq72Sko0?si=jdGzJkFafMditbjy
  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
  };

  # System State Version
  system.stateVersion = "24.11";
}
