{ config, pkgs, ... }:

let
  unstable = import 
    (builtins.fetchTarball "channel:nixos-unstable")
    { config = config.nixpkgs.config; };
in
  {
    environment.systemPackages = with pkgs; [
      unstable.inkscape
      unstable.inkscape-extensions.inkstitch
    ];
  }

# For some reason, it doesn't copy the Ink/Stitch extensions to the config folder. I had to do it manually 🤔
# mkdir -p ~/.config/inkscape/extensions/
# cp -r /nix/store/210kca0gl85sgll3q751y8ygj4cd3174-inkstitch-3.1.0/share/inkscape/extensions/inkstitch/ ~/.config/inkscape/extensions/
