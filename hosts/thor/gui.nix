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
  };

  environment.systemPackages = (with pkgs; [
    autorandr
    xorg.xrandr
  ]); 

  services.autorandr = {
    enable = true;
  };
}
