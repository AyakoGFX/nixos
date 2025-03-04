{ config, pkgs, lib, ... }:

{
  #
  # XDG AND ENVIRONMENT
  #
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = "*";
  };

  environment = {
    sessionVariables = rec {
      XDG_CACHE_HOME = "$HOME/.cache";
      XDG_CONFIG_HOME = "$HOME/.config";
      XDG_DATA_HOME = "$HOME/.local/share";
      XDG_STATE_HOME = "$HOME/.local/state";
    };
    variables = {
      EDITOR = "emacsclient -c";
      VISUAL = "emacsclient -c";
      QT_QPA_PLATFORMTHEME = "qt5ct";
      # QT_QPA_PLATFORM = "xcb";
    };
  };
}
