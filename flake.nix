{
  description = "my first flake";

  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;
    home-manager.url = github:nix-community/home-manager/master;
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        nixos = lib.nixosSystem { # nixos heair in left = hostname
          inherit system;
          modules = [ ./configuration.nix ];
        };
      };
      homeConfigurations = {
        ayako = home-manager.lib.homeManagerConfiguration { # ayako = username
          inherit pkgs;
          modules = [ ./home.nix ];
        };
      };
    };
}
