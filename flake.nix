{
  description = "Your new nix config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
    in
    {
      # Configuration for this system.
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          specialArgs = {
            # INFO: Dont pass `system` as a special arg. This is an anti-pattern
            inherit inputs;
          };
          modules = [
            ./nixos/configuration.nix
            inputs.home-manager.nixosModules.home-manager
            # INFO: Instead do this if you must
            { nixpkgs.hostPlatform = system; }
          ];
        };
      };
    };
}
