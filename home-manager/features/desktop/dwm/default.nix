{
  lib, 
  config,
  pkgs,
  ...
}: {
  imports = [
    ./picom.nix
  ];

  home.packages = with pkgs; [
    rofi
    dmenu
    st
    dunst
    xss-lock
    flameshot
    xdg-desktop-portal-gtk
    xorg.xrdb
    xorg.xrandr
    xorg.xset
    xorg.xsetroot
    xorg.setxkbmap
    xclip
    gnome.gnome-keyring
    feh
    gruvbox-dark-gtk
    kde-gruvbox
    gruvbox-dark-icons-gtk
    alsaUtils
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
