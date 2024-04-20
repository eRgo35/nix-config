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
          src = pkgs.fetchFromGitHub {
            owner = "eRgo35";
            repo = "dwm";
            rev = "a1725eb3c64d27864972a976c8ee18d63a8d9dad";
            sha256 = "sha256-sY6qFqfkfGtLmi+7mownx3bolM2mVNdhS9VUO6KimKk="; 
          };
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
