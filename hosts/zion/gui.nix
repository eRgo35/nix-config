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

    xrandrHeads = [
      {
        output = "HDMI-0";
      }
      {
        output = "DP-2";
        primary = true;
        rate = "74.92";
      }
      {
        output = "DP-0";
        rate = "74.92";
      }
    ];
  };
}
