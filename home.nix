{ config, pkgs, ... }:
# https://gitlab.com/Clsmith1/nixos/-/blob/main/home.nix?ref_type=heads
{
  home.username = "ayako";
  home.homeDirectory = "/home/ayako";
  home.stateVersion = "24.11"; # Please read the comment before changing.

    # Module imports
  # imports = [
    # ./users/shells/sh.nix
    # ./users/apps/emacs/emacs.nix
    # ./users/apps/emulators/wezterm.nix
    # ./users/apps/emulators/kitty.nix
    # ./users/shells/nushell.nix
    # ./users/apps/rofi.nix
  # ];




}
