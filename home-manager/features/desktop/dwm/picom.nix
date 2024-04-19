{
  lib, 
  config,
  pkgs,
  ...
}: {
  services.picom = {
    enable = true;
    package = pkgs.unstable.picom;
    backend = "glx"; 

    shadow = true;
    shadowOpacity = 0.2;
    shadowOffsets = [1 1];

    shadowExclude = [
      "name = 'Notification'"
      "class_g = 'Conky'"
      "_GTK_FRAME_EXTENTS@:c"
      "override_redirect = 1 && !WM_CLASS@:s"
      "class_g ?= 'Dmenu'"
      "class_g ?= 'Dunst'"
      "_NET_WM_STATE@:32a *= '_NET_WM_STATE_HIDDEN'"
      "_GTK_FRAME_EXTENTS@:c"
      "_NET_WM_STATE@:32a *= '_NET_WM_STATE_STICKY'"
      "class_g ?= 'i3-frame'"
      "class_g = 'Rofi'"
    ];

    fade = true;
    fadeSteps = [0.08 0.05];

    vSync = true;

    settings = {
      corner-radius = 9;
      blur = {
        method = "dual_kawase";
        strength = 10;
        background = false;
        background-frame = false;
        background-fixed = false;
      };
    };
 };
}
