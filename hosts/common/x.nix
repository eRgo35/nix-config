{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  services.udisks2.enable = true;
  security.polkit.enable = true;
  services.upower.enable = config.powerManagement.enable;
  services.gvfs.enable = true;

  services.autorandr = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    autorandr
    xorg.xrandr
    xorg.libX11
    xorg.libX11.dev
    xorg.libXft
    xorg.libXinerama
    xorg.xbacklight
    pulseaudioFull
  ];
}
