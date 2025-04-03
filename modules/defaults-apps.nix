{
  pkgs,
  lib,
  config,
  ...
}:
{
  xdg.mime.defaultApplications = {
    "application/gzip" = "org.gnome.FileRoller.desktop";
    "application/pdf" = "firefox.desktop";
    "application/vnd.rar" = "org.gnome.FileRoller.desktop";
    "application/x-7z-compressed" = "org.gnome.FileRoller.desktop";
    "application/x-bzip2" = "org.gnome.FileRoller.desktop";
    "application/x-tar" = "org.gnome.FileRoller.desktop";
    "application/zip" = "org.gnome.FileRoller.desktop";
    "inode/directory" = "org.gnome.Nautilus.desktop";
    "x-scheme-handler/terminal" = "alacritty.desktop";
    # "application/pdf" = "google-chrome-stable.desktop";
    # "inode/directory" = "thunar.desktop";

    "image/png" = "org.gnome.eog.desktop";  # PNG files
    "image/jpeg" = "org.gnome.eog.desktop";  # JPG/JPEG files
    "image/jpg" = "org.gnome.eog.desktop";  # JPG files (optional redundancy)
    "image/gif" = "org.gnome.eog.desktop";  # GIF files
    "image/bmp" = "org.gnome.eog.desktop";  # BMP files
    "image/x-ms-bmp" = "org.gnome.eog.desktop";  # Windows BMP files

  };
}
