{ config, pkgs, lib, ... }:
{
    services = {
    libinput.enable = true;
    };
    environment.systemPackages = with pkgs; [
      libinput
      libinput-gestures
      wmctrl
      xdotool
    ];
}





