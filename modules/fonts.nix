{ config, pkgs, lib, ... }:

{
  fonts = {
    packages = with pkgs; [
      noto-fonts
      iosevka
      roboto-mono
      nerd-fonts.fira-code
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      font-awesome
      source-han-sans
      source-han-serif
      nerd-fonts.jetbrains-mono
      # (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];
    
    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "JetBrainsMono LG M Regular Nerd Font Complete Mono" ];
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
