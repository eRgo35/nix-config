{
  pkgs,
  inputs,
  ...
}: {
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

    kernelPackages = pkgs.linuxPackages_zen;
  };
}
