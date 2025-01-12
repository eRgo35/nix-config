{
  config,
  pkgs,
  ...
}: {
  nixpkgs.config.nvidia.acceptLicense = true;
  services.xserver.videoDrivers = ["nvidia"];

  boot = {
    kernelModules = ["nvidia" "nvidia-uvm"];
    kernelParams = ["nvidia-drm.fbdev=1" "nvidia-drm.modeset=1"];
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
      package = config.boot.kernelPackages.nvidiaPackages.beta;
      open = true;

      nvidiaSettings = true;

      modesetting.enable = true;

      powerManagement = {
        enable = false;
        finegrained = false;
      };
    };
  };
}
