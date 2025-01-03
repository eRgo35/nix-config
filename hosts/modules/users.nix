{
  inputs,
  username,
  hostname,
  pkgs,
  ...
}: {
  imports = [inputs.home-manager.nixosModules.home-manager];

  users.defaultUserShell = pkgs.zsh;

  users.users.${username} = {
    isNormalUser = true;
    description = "${username}";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "games"
      "dialout"
      "libvirtd"
    ];
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs username hostname;};

    users.${username} = {
      imports = [../../home-manager/home.nix];
      programs.home-manager.enable = true;
      home = {
        stateVersion = "24.05";
        username = "${username}";
        homeDirectory = "/home/${username}";
      };
    };
  };
}
