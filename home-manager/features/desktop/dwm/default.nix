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
    brightnessctl
    xclip
    gnome.gnome-keyring
    feh
    gruvbox-dark-gtk
    kde-gruvbox
    gruvbox-dark-icons-gtk
    alsaUtils
    cinnamon.nemo
    pulseaudioFull
    arandr
    neomutt
    ncmpcpp
    ncspot
    ncpamixer
    lf
    qt5ct
    pamixer
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
  };
}
