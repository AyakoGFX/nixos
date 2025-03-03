{ config, pkgs, ... }:

{
  home.username = "ayako";
  home.homeDirectory = "/home/ayako";

  imports = [
    ./home/theme.nix
  ];

  # Ensure home-manager is installed
  home.packages = with pkgs; [
    # home-manager
  ];

  # Enable Home Manager
  programs.home-manager.enable = true;

  # Other configurations...
  home.stateVersion = "24.11"; # Update if necessary
}

# https://gitlab.com/Clsmith1/nixos/-/blob/main/home.nix?ref_type=heads  
# https://github.com/vimjoyer/nixconf
