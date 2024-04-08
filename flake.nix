{
  description = "Mike's Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ...}: 
  let 
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
    systemSettings = {
      profile = "thor"; # select 'thor' or 'zion'
    };
  in {
    nixosConfigurations = {
      zion = lib.nixosSystem {
        inherit system;
        modules = [
          (./. + ("/" + systemSettings.profile)
              + "/configuration.nix")
        ];
        specialArgs = {
          inherit pkgs-unstable;
        };
      };
      thor = lib.nixosSystem {
        inherit system;
        modules = [
          (./. + ("/" + systemSettings.profile)
              + "/configuration.nix")
        ];
        specialArgs = {
          inherit pkgs-unstable;
        };
      };
    };
    homeConfigurations = {
      mike = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          (./. + ("/" + systemSettings.profile)
              + "/configuration.nix")
        ];
        extraSpecialArgs = {
          inherit pkgs-unstable;
        };
      };
    }; 
  };
}
