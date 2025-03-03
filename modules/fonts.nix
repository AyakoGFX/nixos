{ config, pkgs, lib, ... }:

{
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      font-awesome
      source-han-sans
      source-han-sans-japanese
      source-han-serif-japanese
      nerd-fonts.jetbrains-mono
      # (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];
    
    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "JetBrains Mono LG M Regular Nerd Font Complete Mono" ];
        serif = [
          "Noto Serif"
          "Source Han Serif"
        ];
        sansSerif = [
          "Noto Sans"
          "Source Han Sans"
        ];
      };
    };
  };
}
