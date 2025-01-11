{
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./picom.nix
    # ./rofi.nix
    ./flameshot.nix
    ./betterlockscreen.nix
    ./easyeffects.nix
    # ./theming.nix
  ];

  home.packages = with pkgs; [
    dmenu
    st
    dunst
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
    xautolock
    xclip
    # gnome.gnome-keyring
    feh
    alsa-utils
    nemo
    pulseaudioFull
    arandr
    neomutt
    ncmpcpp
    ncspot
    ncpamixer
    lf
    pamixer
    w3m
    bat
    efibootmgr
    eww
    fontconfig
    freetype
    gnugrep
    gparted
    nfs-utils
    openssl
    polkit_gnome
    ripgrep
    stdenv
    tldr
    variety
    virt-manager
    xfce.thunar
    dconf
    xidlehook
  ];

  home.file = {
    ".xinitrc" = {
      source = ./.xinitrc;
    };
    ".zprofile" = {
      source = ./.zprofile;
    };
    ".config/bar.sh" = {
      source = ./bar.sh;
    };
    # ".Xresources" = {
    #   text = ''
    #     Xcursor.theme: "Bibata-Modern-Classic"
    #     Xcursor.size: 18
    #   '';
    # };
  };
}
