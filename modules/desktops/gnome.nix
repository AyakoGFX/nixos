{ config, pkgs, lib, ... }:

{
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  environment.systemPackages = with pkgs.gnomeExtensions; [
    blur-my-shell
    launch-new-instance
  ];
  environment = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };
    variables = {
      QT_QPA_PLATFORM = "wayland";
    };
  };
}
