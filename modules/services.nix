{ config, pkgs, lib, ... }:

{
  services = {
    locate.enable = true;
    printing.enable = true;
    openssh.enable = true;
    tumbler.enable = true;
    flatpak.enable = true;
    # pulseaudio.enable = false;
    hardware.openrgb.enable = true;
    gnome.gnome-keyring.enable = true;
    libinput.touchpad.naturalScrolling = true;
    libinput.mouse.accelProfile = "flat";
    gvfs = {
      enable = true;
      package = lib.mkForce pkgs.gnome.gvfs;
    };
  };
}

  # use full in the future
  # -- services.libinput.touchpad.disableWhileTyping
