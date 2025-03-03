{ config, pkgs, lib, ... }:

{
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Excluding some KDE Plasma applications from the default install
  environment.plasma6.excludePackages = with pkgs.libsForQt5; [
    plasma-browser-integration
    konsole
    oxygen
  ];
  
}
  
