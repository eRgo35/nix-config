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
      setupCommands = ''
        LEFT='HDMI-0'
        CENTER='DP-2'
        RIGHT='DP-0'
        ${pkgs.xorg.xrandr}/bin/xrandr \
        --output $LEFT --mode 1920x1080 --rate 60.00 --pos 0x360 \
        --output $CENTER --primary --mode 2560x1440 --rate 74.92 --pos 1920x0 \
        --output $RIGHT --mode 2560x1440 --rate 74.92 --pos 4480x0
      '';
    };
    
    windowManager = {
      dwm = {
        enable = true;
        package = pkgs.dwm.overrideAttrs {
          src = /home/mike/Projects/dwm;
        };
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
      }
      {
        output = "DP-0";
      }
    ];
  };
}
