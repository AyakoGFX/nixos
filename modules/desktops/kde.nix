{ config, pkgs, lib, ... }:

{
  # services.displayManager.sddm.enable = true;
  services.displayManager.plasma-login-manager.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Excluding some KDE Plasma applications from the default install
  environment.plasma6.excludePackages = with pkgs.libsForQt5; [
    # plasma-browser-integration
    # konsole
    # oxygen
  ];
  environment.systemPackages = with pkgs; [
    
  ];
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-m17n
    ];
  };
}


# kde export setting / preference bash script
# https://gitlab.com/cscs/transfuse   


# rm -rf ~/.config/kde*
# rm -rf ~/.config/plasma*
# rm -rf ~/.cache/plasma*
# rm -rf ~/.local/share/kxmlgui5
