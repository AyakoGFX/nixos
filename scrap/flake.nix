{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable"; # this can be stable, but if it is do not make hyprpanel follow it
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
  };
  outputs = inputs @ {
    nixpkgs,
    ...
  }: let
    system = "x86_64-linux"; # change to whatever your system should be
  in {
    nixosConfigurations."nixos" = nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit system;
        inherit inputs;
      };
      modules = [
        ./configuration.nix
        {nixpkgs.overlays = [inputs.hyprpanel.overlay];}
      ];
    };
  };
}
