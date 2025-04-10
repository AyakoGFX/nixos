{ pkgs, lib, config, ... }:
let
  enableAwesomeWM = false;
  enablehyprland = false;
  enableGNOME = false; # when enable this off power-management.nix in configuration.nix
  enableKDE = false; # when enable this off power-management.nix in configuration.nix
  enableIceWM = false;
  enableNiri = true;
in
{
  imports = lib.concatLists [
    (lib.optionals enableAwesomeWM [ ./desktops/awesome.nix ])
    (lib.optionals enableIceWM [ ./desktops/icewm.nix ])
    (lib.optionals enablehyprland [ ./desktops/hyprland.nix ])
    (lib.optionals enableKDE [ ./desktops/kde.nix ])
    (lib.optionals enableGNOME [ ./desktops/gnome.nix ])
    (lib.optionals enableNiri [ ./desktops/niri.nix ])
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
