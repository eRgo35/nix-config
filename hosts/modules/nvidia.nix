{
  config,
  pkgs,
  ...
}: {
  nixpkgs.config.nvidia.acceptLicense = true;
  services.xserver.videoDrivers = ["nvidia"];

  boot = {
    kernelModules = ["nvidia-uvm"];
    kernelParams = ["nvidia-drm.fbdev=1"];
  };

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        egl-wayland
        vaapiVdpau
        libvdpau-va-gl
        nvidia-vaapi-driver
      ];
    };

    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      open = false;

      nvidiaSettings = true;

      modesetting.enable = true;

      powerManagement = {
        enable = false;
        finegrained = false;
      };
    };
  };
}
