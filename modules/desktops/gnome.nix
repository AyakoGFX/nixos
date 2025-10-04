{ config, pkgs, lib, ... }:

{
  services.desktopManager.gnome.enable = true;
  services.displayManager.gdm.enable = true;
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
