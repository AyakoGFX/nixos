{ config, pkgs, lib, ... }:

{
  hardware = {
    bluetooth.enable = true;
    pulseaudio.enable = false;
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        rocmPackages.clr.icd
      ];
    };
  };
}
