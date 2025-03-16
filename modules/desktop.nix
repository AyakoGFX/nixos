{ pkgs, lib, config, ... }:
let
  enableAwesomeWM = false;
  enableGNOME = false; # when enable this off power-management.nix in configuration.nix
  enableIceWM = false;
  enableKDE = false;
  enablehyprland = true;
in
{
  imports = lib.concatLists [
    (lib.optionals enableAwesomeWM [ ./desktops/awesome.nix ])
    (lib.optionals enableIceWM [ ./desktops/icewm.nix ])
    (lib.optionals enablehyprland [ ./desktops/hyprland.nix ])
    (lib.optionals enableKDE [ ./desktops/kde.nix ])
    (lib.optionals enableGNOME [ ./desktops/gnome.nix ])
  ];

  # Not in block (always enabled)
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
  };
}
