{ config, pkgs, lib, ... }:

{
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  # services.desktopManager.gnome.enable = true;
  # services.displayManager.gdm.enable = true;
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
