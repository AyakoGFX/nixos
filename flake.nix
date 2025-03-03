{
  description = "install home manager";
  
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;
    home-manager.url = github:nix-community/home-manager/master;
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = {self, nixpkgs, home-manager, ...}:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkg = nixpkgs.legacyPackages.${system};
    in
      {
        nixosConfiguration ={
          nixos = lib.nixosSystem {
            inherit system;
            modules = [./configuration.nix];
          };
        };
        homeConfiguration = {
          chris = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            modules = [./home.nix];
          };
        };
      };
}
