{
  description = "My NixOS Flake Configuration";

  inputs = {
    # Noctalia explicitly requires nixpkgs unstable
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    # Add Noctalia here
    noctalia.url = "github:noctalia-dev/noctalia-shell";
    noctalia.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, noctalia, ... }@inputs: {
    # Make sure 'ayako-laptop' matches your networking.hostName if you have one set
    nixosConfigurations.ayako = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; }; # This makes 'inputs' available in your modules
      modules = [
        ./configuration.nix
      ];
    };
  };
}
