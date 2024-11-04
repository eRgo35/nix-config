{
  description = "Mike's Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

    hyprsunset.url = "github:hyprwm/hyprsunset";
    hyprsysteminfo.url = "github:/hyprwm/hyprsysteminfo";
    hyprpolkitagent.url = "github:hyprwm/hyprpolkitagent";

    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
    };

    split-monitor-workspaces = {
      url = "github:Duckonaut/split-monitor-workspaces";
      inputs.hyprland.follows = "hyprland"; # <- make sure this line is present for the plugin to work as intended
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.1";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.pre-commit-hooks-nix.follows = "";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, ... } @inputs: {

    nixosConfigurations = {
      zion = nixpkgs.lib.nixosSystem {
        modules = [ ./hosts ];
        specialArgs = {
          inherit inputs;
          username = "mike";
          hostname = "zion";
        };
      };

      thor = nixpkgs.lib.nixosSystem {
        modules = [ ./hosts ];
        specialArgs = {
          inherit inputs;
          username = "mike";
          hostname = "thor";
        };
      };

      server = nixpkgs.lib.nixosSystem {
        modules = [ ./hosts ];
        specialArgs = {
          inherit inputs;
          username = "mike";
          hostname = "server";
        };
      };
    };
  };
}
