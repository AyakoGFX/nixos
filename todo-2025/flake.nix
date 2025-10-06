{
  description = "NixOS configuration with Home Manager";

  inputs = {
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";
    # nur.url = "github:nix-community/NUR";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {
      # Replace 'your-hostname' with your actual hostname
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          
          {
            nixpkgs.config.allowUnfree = true;
          }
          
          # Home Manager module
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.ayako = import ./home.nix;
            
            # Optionally, use extraSpecialArgs to pass arguments to home.nix
            # home-manager.extraSpecialArgs = { inherit inputs; };
          }
        ];
      };
    };
  };
}
