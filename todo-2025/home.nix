{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should manage
  home.username = "ayako";
  home.homeDirectory = "/home/ayako";

  # This value determines the Home Manager release that your configuration is compatible with
  home.stateVersion = "25.05"; # Check your NixOS version

  # Packages to install for this user
  home.packages = with pkgs; [
    # htop
    # neofetch
    # Add more packages here
  ];

  # Program-specific configurations
  # programs.git = {
    # enable = true;
    # userName = "Your Name";
    # userEmail = "your.email@example.com";
  # };

  # programs.bash = {
    # enable = true;
    # shellAliases = {
      # ll = "ls -la";
      # update = "sudo nixos-rebuild switch --flake /etc/nixos#your-hostname";
    # };
  # };

  # Let Home Manager manage itself
  programs.home-manager.enable = true;
}
