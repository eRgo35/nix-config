{
  lib,
  config,
  pkgs,
  ...
}: {
  services.picom = {
    enable = true;
    package = pkgs.picom;
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
      shadow = {
        radius = 3;
      };

      corner-radius = 9;
      rounder-corners-exclude = [
        "window_type = 'dock'"
        "window_type = 'desktop'"
        "class_g = 'Dunst'"
      ];

      blur = {
        method = "dual_kawase";
        strength = 10;
        background = false;
        background-frame = false;
        background-fixed = false;
      };

      blur-kern = "3x3box";

      # xprop | grep -i 'class'
      opacity-rule = [
        "90:class_g = 'neovide'"
        "90:class_g = 'code-oss'"
        "90:class_g = 'discord'"
        "90:class_g = 'Emacs'"
        "90:class_g = 'TelegramDesktop'"
        "90:class_g = 'Spotify'"
        "90:class_g = 'easyeffects'"
        "90:class_g = 'kitty'"
        "90:class_g = 'Nemo'"
        "97:class_g = 'firefox'"
      ];

      # Exclude conditions for background blur.
      # blur-background-exclude = []
      blur-background-exclude = [
        "window_type = 'dock'"
        "window_type = 'desktop'"
        "_GTK_FRAME_EXTENTS@:c"
      ];

      mark-wmwin-focused = true;
      mark-ovredir-focused = true;
      detect-rounded-corners = true;
      detect-client-opacity = true;
      unredir-if-possible = false;
      detect-transient = true;
      detect-client-leader = true;
      use-damage = true;

      window-shader-fg-rule = [
        # "black_to_transparent.frag:class_g = 'stalonetray'",
        # "black_to_transparent.frag:class_g = 'Minecraft 1.7.10'",
        # "black_to_transparent.frag:class_g = 'i3lock'"
        # "black_to_transparent.frag:focused = true",
        # "black_to_transparent.frag:focused != true",
        #"sphere.glsl:focused != true"
        #"nordify.glsl:class_g = 'miru'"
      ];
    };
  };
}
