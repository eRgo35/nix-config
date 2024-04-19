{
  lib, 
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    rofi
    dmenu
    st
    dunst
    unstable.picom
    xss-lock
    flameshot
    xdg-desktop-portal-gtk
    xorg.xrdb
    xorg.xrandr
    xorg.xset
    xorg.xsetroot
    xorg.setxkbmap
    gnome.gnome-keyring
    feh
    gruvbox-dark-gtk
    kde-gruvbox
    gruvbox-dark-icons-gtk
    alsaUtils

  ];
}
