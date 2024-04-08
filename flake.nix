{
  description = "Mike's Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-alien.url = "github:thiagokokada/nix-alien";
  };

  outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, home-manager, nix-alien, ...}: 
  let 
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
    systemSettings = {
      profile = "zion"; # select 'thor' or 'zion'
    };
  in {
    nixosConfigurations = {
      system = lib.nixosSystem {
        inherit system;
        modules = [
          (./. + ("/" + systemSettings.profile)
              + "/configuration.nix")
         
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;

              users.mike = import ./home.nix;
              
              extraSpecialArgs = {
                inherit pkgs-unstable;
              };
            };
          }
        ];
        specialArgs = {
          inherit pkgs-unstable;
        };
      };
    };
  };
}
