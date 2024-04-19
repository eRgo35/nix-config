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
      };
    };

    desktopManager = {
      xfce = {
        enable = false;
      };
    };
  };
}
