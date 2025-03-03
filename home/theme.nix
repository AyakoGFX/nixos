{ config, pkgs, ... }:

{ 
  gtk.enable = true;
  qt.enable = true;

  gtk.cursorTheme.package = pkgs.bibata-cursors;
  gtk.cursorTheme.name = "Bibata-Modern-Ice";

  # gtk.theme.package = pkgs.adw-gtk3;
  # gtk.theme.name = "adw-gtk3";

  gtk.theme.package = pkgs.arc-theme;
  gtk.theme.name = "Arc-Dark";

  gtk.iconTheme.package = pkgs.papirus-icon-theme;
  gtk.iconTheme.name = "Papirus-Dark";
}
