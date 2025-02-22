{
  pkgs,
  lib,
  config,
  ...
}:
let
  enableAwesomeWM = true;
  enableKDE = false;
  enableGNOME = false;
  enableIceWM = true;
  enableXmonad = false;
in
{
  config = lib.mkMerge [

    # Block 1: AwesomeWM
    (lib.mkIf enableAwesomeWM {
      services.xserver = {
        enable = true;
        displayManager.lightdm.enable = true;
        windowManager.awesome.enable = true;
        xkb = {
          layout = "us";
          variant = "";
        };
      };
    })

    (lib.mkIf enableIceWM {
      services.xserver.windowManager.icewm.enable = true;
    })

    # Block 2: KDE
    (lib.mkIf enableKDE {
      services.displayManager.sddm.enable = true;
      services.desktopManager.plasma6.enable = true;

      # Excluding some KDE Plasma applications from the default install
      environment.plasma6.excludePackages = with pkgs.libsForQt5; [
        plasma-browser-integration
        konsole
        oxygen
      ];
    })

    # Block 3: GNOME
    (lib.mkIf enableGNOME {
      services.xserver.displayManager.gdm.enable = true;
      services.xserver.desktopManager.gnome.enable = true;
      environment.gnome.excludePackages =
        (with pkgs; [
          gnome-photos
          gnome-tour
          gedit # text editor
        ])
        ++ (with pkgs.gnome; [
          cheese # webcam tool
          gnome-music
          gnome-terminal
          epiphany # web browser
          geary # email reader
          evince # document viewer
          gnome-characters
          totem # video player
          tali # poker game
          iagno # go game
          hitori # sudoku game
          atomix # puzzle game
        ]);
    })

    # Not in block (always enabled)
    {
      services.xserver = {
        enable = true;
        xkb = {
          layout = "us";
          variant = "";
        };
      };
    }
  ];
}
