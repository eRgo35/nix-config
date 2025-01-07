{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    dmenu
    st
    xss-lock
    xdg-desktop-portal-gtk
    xorg.xrdb
    xorg.xrandr
    xorg.xset
    xorg.xsetroot
    xorg.setxkbmap
    xorg.xbacklight
    xorg.libX11
    xorg.libX11.dev
    xorg.libxcb
    xorg.libXft
    xorg.libXinerama
    xorg.xinit
    xorg.xinput
    brightnessctl
    xclip
    arandr
    w3m
    fontconfig
    freetype
    gnumake
    nfs-utils
    ninja
    openssl
    polkit_gnome
    stdenv
    tldr
    dconf
  ];

  # X Server settings
  services.xserver = {
    enable = true;
    xkb = {
      layout = "pl";
      variant = "";
    };
    dpi = 100;

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
      hypr = {
        enable = true;
      };
      dwm = {
        enable = true;
        package = pkgs.dwm.overrideAttrs {
          src = pkgs.fetchFromGitHub {
            owner = "eRgo35";
            repo = "dwm";
            rev = "main";
            hash = "sha256-sMw4TvuuBlKV4Qb77gyNWRQr1VXX1dEiBUlWusKNgDQ=";
          };
        };
      };
    };

    desktopManager = {
      xfce = {
        enable = true;
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

  services.autorandr = {
    enable = true;
    defaultTarget = "zion";
    profiles = {
      "zion" = {
        fingerprint = {
          HDMI-0 = "00ffffffffffff004c2db30a000000003416010380301b780a2621a65555a0280d5054bdef80714f81c0810081809500a9c0b3000101023a801871382d40582c4500dd0c1100001e662156aa51001e30468f3300dd0c1100001e000000fd00184b0f5117000a202020202020000000fc00543232433330300a202020202001dc020325f14d901f04130514031220212207162309070783010000e2000f67030c001000b82d011d007251d01e206e285500dd0c1100001e011d00bc52d01e20b8285540dd0c1100001e011d8018711c1620582c2500dd0c1100009e011d80d0721c1620102c2580dd0c1100009e000000000000000000000000000000000000ec";
          DP-2 = "00ffffffffffff000472c90672bb9004311e0104b53c22783f0c95ab554ca0240d5054bfef80714f8140818081c081009500b300d1c0565e00a0a0a029503020350055502100001a000000fd00304b70701e010a202020202020000000fc005647323730550a202020202020000000ff005445484545303034383532430a0146020318f14b010203040590111213141f23090707830100009774006ea0a034501720680855502100001a2a4480a0703827403020350055502100001a023a801871382d40582c450055502100001e011d8018711c1620582c250055502100009e011d007251d01e206e28550055502100001e0000000000000000000000000040";
          DP-0 = "00ffffffffffff000472c9064bbc9004311e0104b53c22783f0c95ab554ca0240d5054bfef80714f8140818081c081009500b300d1c0565e00a0a0a029503020350055502100001a000000fd00304b70701e010a202020202020000000fc005647323730550a202020202020000000ff005445484545303034383532430a016c020318f14b010203040590111213141f23090707830100009774006ea0a034501720680855502100001a2a4480a0703827403020350055502100001a023a801871382d40582c450055502100001e011d8018711c1620582c250055502100009e011d007251d01e206e28550055502100001e0000000000000000000000000040";
        };
        config = {
          HDMI-0 = {
            enable = true;
            position = "0x360";
            mode = "1920x1080";
            rate = "60.00";
          };
          DP-2 = {
            enable = true;
            primary = true;
            position = "1920x0";
            mode = "2560x1440";
            rate = "74.92";
          };
          DP-0 = {
            enable = true;
            position = "4480x0";
            mode = "2560x1440";
            rate = "74.92";
          };
        };
      };
    };
  };
}
