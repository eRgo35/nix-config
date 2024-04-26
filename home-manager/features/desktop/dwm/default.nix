{
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./picom.nix
    ./rofi.nix
    ./flameshot.nix
    ./betterlockscreen.nix
    ./easyeffects.nix
    ./theming.nix
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
    xclip
    # gnome.gnome-keyring
    feh
    alsaUtils
    cinnamon.nemo
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
    fuse-common
    gimp
    gnugrep
    gnumake
    gparted
    nfs-utils
    ninja
    nodejs
    openssl
    nerdfonts
    polkit_gnome
    qemu
    ripgrep
    stdenv
    tldr
    variety
    virt-manager
    xfce.thunar
    dconf
  ];

  home.file = {
    ".xinitrc" = {
      source = ./.xinitrc;
    };
    ".zprofile" = {
      source = ./.zprofile;
    };
    ".config/picom/black_to_transparent.frag" = {
      source = ./black_to_transparent.frag;
    };
    # ".Xresources" = {
    #   text = ''
    #     Xcursor.theme: "Bibata-Modern-Classic"
    #     Xcursor.size: 18
    #   '';
    # };
  };
}
