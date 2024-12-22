{ lib
, pkgs
, inputs
, hostname
, ...
}:
{
  # ------------------------------------------------
  # Needed Packages
  # ------------------------------------------------

  home.packages = with pkgs; [
    qt6ct
    qt6.qtwayland

    hyprshot
    hyprshade
    hyprpicker

    inputs.hyprsunset.packages."${pkgs.system}".hyprsunset
    inputs.hyprsysteminfo.packages."${pkgs.system}".hyprsysteminfo
    inputs.hyprpolkitagent.packages."${pkgs.system}".hyprpolkitagent

    xdg-desktop-portal-hyprland

    wev
    wlr-randr
    wdisplays
    wl-clipboard
    # wl-copy
    # wl-paste
    # wf-recorder
    # wl-screenrec

    playerctl
    brightnessctl
  ];

  # ------------------------------------------------
  # Hyprland Config
  # ------------------------------------------------

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;

    plugins = [
      inputs.split-monitor-workspaces.packages."${pkgs.system}".split-monitor-workspaces
    ];

    # ------------------------------------------------
    # Configuration
    # ------------------------------------------------

    # settings = {

    #   "$mod" = "SUPER";
    #   "$shiftMod" = "SUPER_SHIFT";
    #   "$Alt_L" = "ALT";

    #   # App
    #   "$terminal" = "kitty";
    #   "$browser" = "firefox";
    #   "$launcher" = "rofi -show drun";
    #   "$file-manager" = "nemo";
    #   "$Tfile-manager" = "$terminal -e yazi";
    #   "$audio-manager" = "com.saivert.pwvucontrol";
    #   "$password-manager" = "org.keepassxc.KeePassXC";
    #   "$bluetooth-manager" = "io.github.kaii_lb.Overskride";

    #   # ------------------------------------------------
    #   # Envirronement variables
    #   # ------------------------------------------------

    #   env = [
    #     "XDG_SESSION_TYPE,wayland"
    #     "XDG_CURRENT_DESKTOP,Hyprland"
    #     "XDG_SESSION_DESKTOP,Hyprland"

    #     "DISABLE_QT5_COMPAT,1"
    #     "QT_QPA_PLATFORM,wayland"
    #     "QT_AUTO_SCREEN_SCALE_FACTOR,1"
    #     "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"

    #     "NIXOS_OZONE_WL,1"
    #     "ELECTRON_OZONE_PLATFORM_HINT,auto"

    #     "GTK_WAYLAND_DISABLE_WINDOWDECORATION,1"
    #   ];

    #   # ------------------------------------------------
    #   # Startup
    #   # ------------------------------------------------

    #   exec-once = [
    #     "waybar"
    #     # "systemctl --user start hyprpolkitagent"
    #   ];

    #   # ------------------------------------------------
    #   # Monitors
    #   # ------------------------------------------------

    #   monitor = [
    #     "HDMI-A-1, preferred, 0x360, 1"
    #     "DP-1, highrr, 4480x0, 1"
    #     "DP-2, highrr, 1920x0, 1"
    #   ];

    #   # ------------------------------------------------
    #   # Window Rules
    #   # ------------------------------------------------

    #   windowrule = [
    #     "float, ^($terminal)$"
    #     "size 45% 45%,^($terminal)$"

    #     "float, ^($password-manager)$"
    #     "size 50% 40%,^($password-manager)$"

    #     "float, ^($bluetooth-manager)$"
    #     "size 50% 60%,^($bluetooth-manager)$"

    #     "float,  ^($audio-manager)$"
    #     "size 50% 30%,^($audio-manager)$"

    #     "noblur,    class:^(steam)"
    #     "forcergbx, class:^(steam)"
    #   ];

    #   # ------------------------------------------------
    #   # Keybidings
    #   # ------------------------------------------------

    #   bind = [
    #     # Apps
    #     "ALT, code:10, exec, $browser"
    #     "ALT, code:11, exec, $file-manager"
    #     "ALT, code:12, exec, $Tfile-manager"

    #     # System
    #     "SUPER, RETURN, exec, $terminal"
    #     "SUPER, X,      exec, powermenu"
    #     "SUPER, R,      exec, $launcher"

    #     "SUPER, Q, killactive"
    #     "SUPER, F, fullscreen"
    #     "SUPER, T, togglefloating"

    #     # Screenshot
    #     "ALT, S ,                  exec , hyprshot -m region --clipboard-only"
    #     "CONTROL&ALT , S ,         exec , hyprshot -m region "
    #     "CONTROL&ALT&SHIFT_L , S , exec , hyprshot -m output"

    #     # Window Focus
    #     "SUPER, h, movefocus, l"
    #     "SUPER, l, movefocus, r"
    #     "SUPER, k, movefocus, u"
    #     "SUPER, j, movefocus, d"

    #     # Switch workspaces with mainMod + [0-9]
    #     "SUPER, code:10, workspace,  1"
    #     "SUPER, code:11, workspace,  2"
    #     "SUPER, code:12, workspace,  3"
    #     "SUPER, code:13, workspace,  4"
    #     "SUPER, code:14, workspace,  5"
    #     "SUPER, code:15, workspace,  6"
    #     "SUPER, code:16, workspace,  7"
    #     "SUPER, code:17, workspace,  8"
    #     "SUPER, code:18, workspace,  9"
    #     "SUPER, code:19, workspace, 10"

    #     # Move active window to a workspace with mainMod + SHIFT + [0-9]
    #     "SUPER SHIFT, code:10, movetoworkspace,  1"
    #     "SUPER SHIFT, code:11, movetoworkspace,  2"
    #     "SUPER SHIFT, code:12, movetoworkspace,  3"
    #     "SUPER SHIFT, code:13, movetoworkspace,  4"
    #     "SUPER SHIFT, code:14, movetoworkspace,  5"
    #     "SUPER SHIFT, code:15, movetoworkspace,  6"
    #     "SUPER SHIFT, code:16, movetoworkspace,  7"
    #     "SUPER SHIFT, code:17, movetoworkspace,  8"
    #     "SUPER SHIFT, code:18, movetoworkspace,  9"
    #     "SUPER SHIFT, code:19, movetoworkspace, 10"
    #   ];

    #   bindm = [
    #     "SUPER, mouse:272, movewindow"
    #     "SUPER, mouse:273, resizewindow"
    #   ];

    #   bindl = [
    #     ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
    #     ",switch:Lid Switch, exec, pidof hyprlock || hyprlock"
    #   ];

    #   bindle = [
    #     ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+ -l 1"
    #     ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"

    #     ", XF86AudioPlay , exec , playerctl play-pause"
    #     ", XF86AudioStop , exec , playerctl pause"
    #     ", XF86AudioPrev , exec , playerctl previous"
    #     ", XF86AudioNext , exec , playerctl next"

    #     ", XF86MonBrightnessUp,   exec, brightnessctl -q s 5%+"
    #     ", XF86MonBrightnessDown, exec, brightnessctl -q s 5%-"
    #   ];

    #   # ------------------------------------------------
    #   # Sections
    #   # ------------------------------------------------

    #   xwayland = { enabled = false; };
    #   opengl = { force_introspection = 1; };

    #   animations = { enabled = false; };
    #   decoration = { drop_shadow = false; blur = { enabled = false; }; };

    #   general = {
    #     gaps_in = 4;
    #     gaps_out = 0;
    #     border_size = 2;
    #     "col.active_border" = "rgb(F5A97F) rgb(ED8796) rgb(C6A0F6) rgb(8AADF4) rgb(A6DA95) rgb(EED49F)";

    #     layout = "dwindle";
    #   };

    #   misc = {
    #     vfr = true;
    #     vrr = 1;

    #     focus_on_activate = true;

    #     disable_autoreload = true;
    #     disable_hyprland_logo = true;
    #     disable_splash_rendering = true;
    #   };

    #   input = {
    #     kb_layout = "us";
    #     kb_variant = "";

    #     follow_mouse = 1;
    #     accel_profile = "flat";
    #     sensitivity = 0.4;
    #     repeat_delay = 300;
    #     repeat_rate = 50;

    #     touchpad = {
    #       natural_scroll = true;
    #       clickfinger_behavior = true;
    #       disable_while_typing = true;
    #     };
    #   };
    # };
    extraConfig = ''
      # This is an example Hyprland config file.
      # Refer to the wiki for more information.
      # https://wiki.hyprland.org/Configuring/Configuring-Hyprland/

      # Please note not all available settings / options are set here.
      # For a full list, see the wiki

      # You can split this configuration into multiple files
      # Create your files separately and then link them to this file like this:
      # source = ~/.config/hypr/myColors.conf


      ################
      ### MONITORS ###
      ################

      # See https://wiki.hyprland.org/Configuring/Monitors/
      monitor=, preferred, auto, 1
      monitor=HDMI-A-1, preferred, 0x360, 1
      monitor=DP-1, highrr, 4480x0, 1
      monitor=DP-2, highrr, 1920x0, 1


      ###################
      ### MY PROGRAMS ###
      ###################

      # See https://wiki.hyprland.org/Configuring/Keywords/

      # Set programs that you use
      $terminal = kitty
      $fileManager = nemo
      $menu = rofi -show drun
      $lock = pidof hyprlock || hyprlock
      $editor = zed
      $browser = zen-browser
      $picker = hyprpicker -a -f hex

      #################
      ### AUTOSTART ###
      #################

      # Autostart necessary processes (like notifications daemons, status bars, etc.)

      # exec-once = hyprpm reload -n
      exec-once = hypridle
      exec-once = dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
      # exec-once=zsh $HOME/.config/hypr/autostart.sh
      exec-once = waybar
      # exec-once = keepassxc

      #############################
      ### ENVIRONMENT VARIABLES ###
      #############################

      # See https://wiki.hyprland.org/Configuring/Environment-variables/

      env = XCURSOR_SIZE,24
      env = XCURSOR_THEME,/usr/share/icons/Gruvbox-Dark/index.theme
      env = HYPRCURSOR_SIZE,24
      env = HYPRCURSOR_THEME,/usr/share/icons/Gruvbox-Dark/index.theme

      env = CLUTTER_BACKEND,wayland
      env = GDK_BACKEND,wayland,x11
      env = QT_AUTO_SCREEN_SCALE_FACTOR,1
      env = QT_QPA_PLATFORMTHEME,qt5ct
      env = QT_QPA_PLATFORMTHEME,qt6ct
      env = QT_SCALE_FACTOR,1
      env = QT_WAYLAND_DISABLE_WINDOWDECORATION,1

      # Nvidia
      env = LIBVA_DRIVER_NAME,nvidia
      env = XDG_SESSION_TYPE,wayland
      env = GBM_BACKEND,nvidia-drm
      env = __GLX_VENDOR_LIBRARY_NAME,nvidia
      env = WLR_NO_HARDWARE_CURSORS,1
      env = __NV_PRIME_RENDER_OFFLOAD,1
      env = __VK_LAYER_NV_optimus,NVIDIA_only
      env = __GL_THREADED_OPTIMIZATIONS,0

      # Wayland enforce
      env = QT_QPA_PLATFORM,wayland
      # env = QT_QPA_PLATFORM,wayland;xcb
      env = ELECTRON_OZONE_PLATFORM_HINT,wayland
      env = XDG_CURRENT_DESKTOP,Hyprland
      env = XDG_SESSION_DESKTOP,Hyprland

      # Java
      env = _JAVA_AWT_WM_NONREPARENTING,1
      env = _JAVA_OPTIONS,-Dawt.useSystemAAFontSettings=on

      # Firefox
      env = MOZ_ENABLE_WAYLAND,1
      env = MOZ_DISABLE_RDD_SANDBOX,1
      env = EGL_PLATFORM,wayland

      # Electron
      env = ELECTRON_OZONE_PLATFORM_HINT,auto

      # Input
      env = QT_IM_MODULE,fcitx
      env = XMODIFIERS=@im=fcitx
      env = GLFW_IM_MODULE,ibus

      # SSH Agents
      env = SSH_AUTH_SOCK,$XDG_RUNTIME_DIR/ssh-agent.socket

      env = NIXOS_OZONE_WL,1

      #####################
      ### LOOK AND FEEL ###
      #####################

      # Refer to https://wiki.hyprland.org/Configuring/Variables/

      # https://wiki.hyprland.org/Configuring/Variables/#general
      general {
          gaps_in = 10
          gaps_out = 20

          border_size = 1

          # https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
          col.active_border = rgba(fabd2fee) rgba(fe8019ee) 45deg
          col.inactive_border = rgba(928374aa)

          # Set to true enable resizing windows by clicking and dragging on borders and gaps
          resize_on_border = false

          # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
          allow_tearing = false

          layout = dwindle
      }

      # https://wiki.hyprland.org/Configuring/Variables/#decoration
      decoration {
          rounding = 10

          # Change transparency of focused and unfocused windows
          active_opacity = 0.98
          inactive_opacity = 0.95

          # drop_shadow = true
          # shadow_range = 5
          # shadow_render_power = 3
          # col.shadow = rgba(1a1a1aee)

          # https://wiki.hyprland.org/Configuring/Variables/#blur
          blur {
              enabled = true
              size = 4
              passes = 3

              vibrancy = 0.1696
          }
      }

      cursor {
          no_hardware_cursors = true
          inactive_timeout = 5
      }

      # https://wiki.hyprland.org/Configuring/Variables/#animations
      animations {
          enabled = true

          # Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

          bezier = myBezier, 0.05, 0.9, 0.1, 1.05

          animation = windows, 1, 7, myBezier
          animation = windowsOut, 1, 7, default, popin 80%
          animation = border, 1, 10, default
          animation = borderangle, 1, 8, default
          animation = fade, 1, 7, default
          animation = workspaces, 1, 6, default
      }

      # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
      dwindle {
          pseudotile = true # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
          preserve_split = true # You probably want this
      }

      # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
      master {
          new_status = master
      }

      # https://wiki.hyprland.org/Configuring/Variables/#misc
      misc {
          force_default_wallpaper = -1 # Set to 0 or 1 to disable the anime mascot wallpapers
          disable_hyprland_logo = false # If true disables the random hyprland logo / anime girl background. :(
      }


      #############
      ### INPUT ###
      #############

      # https://wiki.hyprland.org/Configuring/Variables/#input
      input {
          kb_layout = pl
          kb_variant =
          kb_model =
          kb_options =
          kb_rules =

          numlock_by_default = true

          follow_mouse = 1

          sensitivity = 0 # -1.0 - 1.0, 0 means no modification.

          touchpad {
              natural_scroll = true
          }
      }

      # https://wiki.hyprland.org/Configuring/Variables/#gestures
      gestures {
          workspace_swipe = false
      }

      # Example per-device config
      # See https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs for more
      # device {
      #     name = epic-mouse-v1
      #     sensitivity = -0.5
      # }

      ###############
      ### PLUGINS ###
      ###############

      plugin {
          split-monitor-workspaces {
              count = 10
              keep_focused = 1
              enable_notifications = 0
          }
      }

      ##############
      ### RENDER ###
      ##############

      render {
          explicit_sync = 1
      }

      xwayland {
        force_zero_scaling = true
      }

      ####################
      ### KEYBINDINGSS ###
      ####################

      # See https://wiki.hyprland.org/Configuring/Keywords/
      $mainMod = SUPER # Sets "Windows" key as main modifier

      # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
      bind = $mainMod SHIFT, RETURN, exec, $terminal
      bind = $mainMod, Q, killactive,
      bind = $mainMod SHIFT, Q, exit
      bind = $mainMod, N, exec, $fileManager
      bind = $mainMod, W, exec, $editor
      bind = $mainMod, Z, exec, $terminal
      bind = $mainMod, B, exec, $browser
      bind = $mainMod SHIFT, L, exec, $lock
      bind = $mainMod, V, togglefloating,
      bind = $mainMod, R, exec, $menu
      bind = $mainMod, SPACE, exec, $menu
      bind = $mainMod SHIFT, C, exec, $picker
      bind = $mainMod, P, pseudo, # dwindle
      bind = $mainMod, J, togglesplit, # dwindle
      bind = $mainMod, F, fullscreen, 1
      bind = $mainMod SHIFT, F, fullscreen, 0
      bind = $mainMod, T, togglefloating
      bind = $mainMod, mouse:274, togglefloating

      # Super Rat Binds
      bind = , mouse:277, exec, amixer set Master playback 2%+
      bind = , mouse:278, exec, amixer set Master playback 2%-
      # bind = , mouse:279, exec, 
      bind = , mouse:280, exec, amixer set Capture toggle

      # Move focus with mainMod + vim keys
      bind = $mainMod, H, movefocus, l
      bind = $mainMod, L, movefocus, r
      bind = $mainMod, K, movefocus, u
      bind = $mainMod, J, movefocus, d

      # Switch workspaces with mainMod + [0-9]
      bind = $mainMod, 1, split-workspace, 1
      bind = $mainMod, 2, split-workspace, 2
      bind = $mainMod, 3, split-workspace, 3
      bind = $mainMod, 4, split-workspace, 4
      bind = $mainMod, 5, split-workspace, 5
      bind = $mainMod, 6, split-workspace, 6
      bind = $mainMod, 7, split-workspace, 7
      bind = $mainMod, 8, split-workspace, 8
      bind = $mainMod, 9, split-workspace, 9
      bind = $mainMod, 0, split-workspace, 10

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      bind = $mainMod SHIFT, 1, split-movetoworkspacesilent, 1
      bind = $mainMod SHIFT, 2, split-movetoworkspacesilent, 2
      bind = $mainMod SHIFT, 3, split-movetoworkspacesilent, 3
      bind = $mainMod SHIFT, 4, split-movetoworkspacesilent, 4
      bind = $mainMod SHIFT, 5, split-movetoworkspacesilent, 5
      bind = $mainMod SHIFT, 6, split-movetoworkspacesilent, 6
      bind = $mainMod SHIFT, 7, split-movetoworkspacesilent, 7
      bind = $mainMod SHIFT, 8, split-movetoworkspacesilent, 8
      bind = $mainMod SHIFT, 9, split-movetoworkspacesilent, 9
      bind = $mainMod SHIFT, 0, split-movetoworkspacesilent, 10

      # Example special workspace (scratchpad)
      bind = $mainMod, D, togglespecialworkspace, magic
      bind = $mainMod SHIFT, D, movetoworkspace, special:magic

      # Move between monitors
      bind = $mainMod, code:60, focusmonitor, -1 # code 60 is a dot (.)
      bind = $mainMod, code:59, focusmonitor, +1 # code 59 is a comma (,)
      # bind = $mainMod SHIFT, BackSpace, movewindow, mon:+1,
      # bind = $mainMod SHIFT, code:59, changemonitorsilent, e-1
      # bind = $mainMod SHIFT, code:60, changemonitorsilent, e+1

      # Scroll through existing workspaces with mainMod + scroll
      bind = $mainMod, mouse_down, workspace, e+1
      bind = $mainMod, mouse_up, workspace, e-1

      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindow

      bind = ,XF86AudioMicMute, exec, amixer set Capture toggle
      bind = ,XF86AudioMute, exec, amixer set Master toggle
      bind = ,XF86AudioRaiseVolume, exec, amixer set Master playback 2%+
      bind = ,XF86AudioLowerVolume, exec, amixer set Master playback 2%-
      bind = ,XF86MonBrightnessUp, exec, brightnessctl set 5%+
      bind = ,XF86MonBrightnessDown, exec, brightnessctl set 5%-
      # bind =CTRL,XF86Launch2, exec, hyprctl keyword monitor "eDP-1,1920x1080@60,0x0,1"
      # bind = SHIFT,XF86Launch2, exec, hyprctl keyword monitor "eDP-1,1920x1080@60,0x0,1.5"
      bind = SHIFT, XF86MonBrightnessDown, exec, brightnessctl set 1%
      bind = SHIFT, XF86MonBrightnessUp, exec, brightnessctl set 100%

      # Screenshot a window
      bind = $mainMod, PRINT, exec, hyprshot -m window
      # Screenshot a monitor
      bind = , PRINT, exec, hyprshot -m output
      # Screenshot a region
      bind = $mainMod SHIFT, S, exec, hyprshot -m region

      ##############################
      ### WINDOWS AND WORKSPACES ###
      ##############################

      # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
      # See https://wiki.hyprland.org/Configuring/Workspace-Rules/ for workspace rules

      # Example windowrule v1
      # windowrule = float, ^(kitty)$

      windowrule=opacity 1.0 override 1.0, ^(firefox)$

      # Example windowrule v2
      # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$

      windowrulev2 = suppressevent maximize, class:.* # You'll probably like this.

      windowrule=fullscreen, flameshot
      windowrule=float,flameshot
      windowrule=monitor 0,flameshot
      windowrule=move 0 0,flameshot
      windowrule=workspace 0,flameshot
      windowrule=stayfocused,flameshot

      windowrulev2=move 0 -195,class:^(flameshot)$

      windowrulev2 = opacity 0.0 override,class:^(xwaylandvideobridge)$
      windowrulev2 = noanim,class:^(xwaylandvideobridge)$
      windowrulev2 = noinitialfocus,class:^(xwaylandvideobridge)$
      windowrulev2 = maxsize 1 1,class:^(xwaylandvideobridge)$
      windowrulev2 = noblur,class:^(xwaylandvideobridge)$
    '';

  };

  #################################
  # Hyprpaper
  #################################
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "off";
      splash = false;
      preload = [ "~/.files/home/wallpapers/blockwavemoon.png" ];
      wallpaper = [ ",~/.files/home/wallpapers/blockwavemoon.png" ];
    };
  };

  #################################
  # Hypridle
  #################################
  services.hypridle = {
    enable = true;

    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };

      listener =
        if hostname == "zion" then
          [
            # {
            #   timeout = 60;
            #   on-timeout = "brightnessctl -sd asus::kbd_backlight set 0";
            #   on-resume = "brightnessctl -rd asus::kbd_backlight";
            # }

            # {
            #   timeout = 80;
            #   on-timeout = "brightnessctl -s set 0";
            #   on-resume = "brightnessctl -r";
            # }

            # {
            #   timeout = 100;
            #   on-timeout = "hyprctl dispatch dpms off ";
            #   on-resume = "hyprctl dispatch dpms on";
            # }

            # {
            #   timeout = 150;
            #   on-timeout = "systemctl suspend";
            # }
            {
              timeout = 300; # 5min
              on-timeout = "brightnessctl -s set 10"; # set monitor backlight to minimum, avoid 0 on OLED monitor.
              on-resume = "brightnessctl -r"; # monitor backlight restore.
            }

            {
              timeout = 600; # 10min
              on-timeout = "loginctl lock-session"; # lock screen when timeout has passed
            }

            # {
            # timeout = 1800; # 30min
            # on-timeout = "systemctl hibernate";
            # on-timeout = hyprctl dispatch dpms off        # screen off when timeout has passed
            # on-resume = hyprctl dispatch dpms on          # screen on when activity is detected after timeout has fired.
            # }
          ]
        else if hostname == "thor" then
          [
            {
              timeout = 450;
              on-timeout = "brightnessctl -s set 0";
              on-resume = "brightnessctl -r";
            }

            {
              timeout = 600;
              on-timeout = "loginctl lock-session"; # lock screen when timeout has passed
            }

            {
              timeout = 750;
              on-timeout = "hyprctl dispatch dpms off ";
              on-resume = "hyprctl dispatch dpms on";
            }

            {
              timeout = 900;
              on-timeout = "systemctl suspend";
            }

            {
              timeout = 1500;
              on-timeout = "systemctl hibernate";
            }
          ]
        else
          [ ];
    };
  };

  #################################
  # Hyprlock
  #################################
  programs.hyprlock = {
    enable = true;

    settings = lib.mkForce {

      general = {
        grace = 5;
        no_fade_in = true;
        no_fade_out = true;
        disable_loading_bar = false;
      };

      background = {
        monitor = "";
        path = "~/.files/home/wallpapers/blockwavemoon.png";
      };

      input-field = [
        {
          monitor = "";
          size = "200 , 50";
          outline_thickness = 7;

          dots_size = 0.2;
          dots_spacing = 0.2;
          dots_center = true;

          fade_on_empty = true;
          fade_timeout = "1000";

          position = "0, -20";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
