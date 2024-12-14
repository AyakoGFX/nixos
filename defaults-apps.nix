{
  pkgs,
  lib,
  config,
  ...
}:
{
  xdg.mime.defaultApplications = {
    "application/zip" = "peazip-extract-desktop.desktop";
    "application/x-7z-compressed" = "peazip-extract-desktop.desktop";
    "application/vnd.rar" = "peazip-extract-desktop.desktop";
    "application/x-tar" = "peazip-extract-desktop.desktop";
    "application/gzip" = "peazip-extract-desktop.desktop";
    "application/x-bzip2" = "peazip-extract-desktop.desktop";
    "application/pdf" = "google-chrome-stable.desktop";
    "x-scheme-handler/terminal" = "alacritty.desktop";
    "inode/directory" = "thunar.desktop";

    "image/png" = "org.gnome.eog.desktop";  # PNG files
    "image/jpeg" = "org.gnome.eog.desktop";  # JPG/JPEG files
    "image/jpg" = "org.gnome.eog.desktop";  # JPG files (optional redundancy)
    "image/gif" = "org.gnome.eog.desktop";  # GIF files
    "image/bmp" = "org.gnome.eog.desktop";  # BMP files
    "image/x-ms-bmp" = "org.gnome.eog.desktop";  # Windows BMP files

  };
}
