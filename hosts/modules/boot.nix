{ pkgs, hostname, inputs, ... }:
{
  imports = if hostname == "zion" then [ inputs.chaotic.nixosModules.default ] else [ ];

  boot = {
    tmp.cleanOnBoot = true;

    loader = {
      timeout = 1;
      efi.canTouchEfiVariables = true;

      systemd-boot = {
        enable = true;
        configurationLimit = 10;
      };
    };

    kernelPackages =
      if hostname == "zion" then pkgs.linuxPackages #linuxPackages_zen #linuxPackages #linuxPackages_latest #linuxPackages_xanmod_latest
      else if hostname == "thor" then pkgs.linuxPackages
      else if hostname == "server" then pkgs.linuxPackages
      else pkgs.linuxPackages_zen;
  };
}
