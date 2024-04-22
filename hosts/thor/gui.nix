{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # X Server settings
  services.xserver = {
    enable = true;
    layout = "pl";
    xkbVariant = "";
    libinput.enable = true;

    displayManager = {
      lightdm = {
        enable = false;
      };
      startx = {
        enable = true;
      };
    };

    windowManager = {
      dwm = {
        enable = true;
        package = pkgs.dwm-customized;
      };
    };

    desktopManager = {
      xfce = {
        enable = false;
      };
    };
  };

  services.autorandr = {
    enable = true;
  };
}
