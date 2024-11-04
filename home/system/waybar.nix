{ pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar.overrideAttrs (oa: { mesonFlags = (oa.mesonFlags or [ ]) ++ [ "-Dexperimental=true" ]; });

    settings.mainBar = {
  	layer = "top"; # Waybar at top layer
    height = 32; # Waybar height (to be removed for auto height)
  spacing = 0; # Gaps between modules (4px)
  position = "top";
  margin = "10 20 0";
  # Choose the order of the modules
  modules-left = [
    "hyprland/workspaces"
   "custom/media"
   ];
  modules-center = ["hyprland/window"];
  modules-right = [
    "mpris"
    # "idle_inhibitor",
    "pulseaudio"
    # "network",
    "cpu"
    "memory"
    # "temperature",
    "backlight"
    # "keyboard-state",
    "battery"
    "clock"
    "tray"
  ];
  # Modules configuration
  # "sway/workspaces = {
  #     "disable-scroll = true,
  #     "all-outputs = true,
  #     "warp-on-scroll = false,
  #     "format = "{name}: {icon}",
  #     "format-icons = {
  #         "1 = "",
  #         "2 = "",
  #         "3 = "",
  #         "4 = "",
  #         "5 = "",
  #         "urgent = "",
  #         "focused = "",
  #         "default = ""
  #     }
  # },
  "hyprland/workspaces" = {
    active-only = false;
    format = "{icon}";
    # format-icons = {
    #   1 = "一";
    #   2 = "二";
    #   3 = "三";
    #   4 = "四";
    #   5 = "五";
    #   6 = "六";
    #   7 = "七";
    #   8 = "八";
    #   9 = "九";
    #   10 = "十";
    #   11 = "一";
    #   12 = "二";
    #   13 = "三";
    #   14 = "四";
    #   15 = "五";
    #   16 = "六";
    #   17 = "七";
    #   18 = "八";
    #   19 = "九";
    #   20 = "十";
    #   21 = "一";
    #   22 = "二";
    #   23 = "三";
    #   24 = "四";
    #   25 = "五";
    #   26 = "六";
    #   27 = "七";
    #   28 = "八";
    #   29 = "九";
    #   30 = "十";
    # };
    on-scroll-up = "hyprctl dispatch workspace e+1";
    on-scroll-down = "hyprctl dispatch workspace e-1";
    persistent-workspaces = {
      HDMI-A-1 = [1 2 3 4 5 6 7 8 9 10];
      DP-1 = [11 12 13 14 15 16 17 18 19 20];
      DP-2 = [21 22 23 24 25 26 27 28 29 30];
    };
  };
  keyboard-state = {
    numlock = false;
    capslock = true;
    format = "{name} {icon}";
    format-icons = {
      locked = "";
      unlocked = "";
    };
  };
  "sway/mode" = {
    format = "<span style=\"italic\">{}</span>";
  };
  "sway/scratchpad" = {
    format = "{icon} {count}";
    show-empty = false;
    format-icons = ["" ""];
    tooltip = true;
    tooltip-format = "{app}: {title}";
  };
  mpris = {
    interval = 1;
    format = "{player_icon} {status_icon}";
    format-paused = "{player_icon} {status_icon}";
    tooltip-format = "{player_icon} {dynamic}";
    tooltip-format-paused = "{player_icon} {dynamic}";
    player-icons = {
      default = "󰎄";
      mpv = "󰝚";
      vlc = "󰕼";
      spotify = "";
    };
    status-icons = {
      playing = "";
      paused = "";
      stopped = "";
    };
    # "ignored-players = ["firefox"]
  };
  mpd = {
    format = "{stateIcon} {consumeIcon}{randomIcon}{repeatIcon}{singleIcon}{artist} - {album} - {title} ({elapsedTime:%M:%S}/{totalTime:%M:%S}) ⸨{songPosition}|{queueLength}⸩ {volume}% ";
    format-disconnected = "Disconnected ";
    format-stopped = "{consumeIcon}{randomIcon}{repeatIcon}{singleIcon}Stopped ";
    unknown-tag = "N/A";
    interval = 2;
    consume-icons = {
      on = " ";
    };
    random-icons = {
      off = "<span color=\"#f53c3c\"></span> ";
      on = " ";
    };
    repeat-icons = {
      on = " ";
    };
    single-icons = {
      on = "1 ";
    };
    state-icons = {
      paused = "";
      playing = "";
    };
    tooltip-format = "MPD (connected)";
    tooltip-format-disconnected = "MPD (disconnected)";
  };
  idle_inhibitor = {
    format = "{icon}";
    format-icons = {
      activated = "󰅶";
      deactivated = "󰾪";
    };
  };
  tray = {
    # "icon-size = 21,
    spacing = 10;
    show-passive-items = true;
  };
  clock = {
    format = "{:%b %d %I:%M %p}";
    tooltip-format = "<big>{:%d %B %Y}</big>\n<tt><small>{calendar}</small></tt>";
    format-alt = "{:%Y-%m-%d %I:%M %p}";
  };
  cpu = {
    format = "{usage}% ";
    tooltip = false;
  };
  memory = {
    format = "{}% ";
  };
  temperature = {
    # "thermal-zone = 2,
    # "hwmon-path = "/sys/class/hwmon/hwmon2/temp1_input",
    critical-threshold = 80;
    # "format-critical = "{temperatureC}°C {icon}",
    format = "{temperatureC}°C {icon}";
    format-icons = ["" "" " "];
  };
  backlight = {
    # "device = "acpi_video1",
    format = "{percent}% {icon}";
    format-icons = ["" "" "" "" "" "" "" "" ""];
  };
  battery = {
    bat = "BAT0";
    states = {
      # good = 95,
      warning = 30;
      critical = 15;
    };
    format = "{capacity}% {icon}";
    format-charging = "{capacity}% ";
    format-plugged = "{capacity}% ";
    format-alt = "{time} {icon}";
    # "format-good = "", # An empty format will hide the module
    # "format-full = "",
    format-icons = ["" "" "" "" ""];
  };
  network = {
    # "interface = "wlp2*", # (Optional) To force the use of this interface
    format-wifi = "{essid} ({signalStrength}%) ";
    format-ethernet = "{ipaddr}/{cidr} 󰈀";
    tooltip-format = "{ifname} via {gwaddr} ";
    format-linked = "{ifname} (No IP) ";
    format-disconnected = "Disconnected ⚠";
    format-alt = "{ifname}: {ipaddr}/{cidr}";
    on-click-right = "kitty nmtui";
  };
  pulseaudio = {
    # "scroll-step = 1, # %, can be a float
    format = "{volume}% {icon} {format_source}";
    format-bluetooth = "{volume}% {icon} {format_source}";
    format-bluetooth-muted = "󰝟 {icon} {format_source}";
    format-muted = "󰝟 {format_source}";
    format-source = " {volume}% ";
    format-source-muted = " ";
    format-icons = {
      headphone = "󰋋";
      hands-free = "󰟅";
      headset = "󰋎";
      phone = "";
      portable = "";
      car = "";
      default = ["" "" ""];
    };
    on-click = "pavucontrol";
  };
  "custom/media" = {
    format = "{icon} {}";
    return-type = "json";
    max-length = 40;
    format-icons = {
      spotify = "";
      default = "🎜";
    };
    escape = true;
    exec = "$HOME/.config/waybar/mediaplayer.py 2> /dev/null"; # Script in resources folder
    # exec = "$HOME/.config/waybar/mediaplayer.py --player spotify 2> /dev/null" # Filter player based on name
  };
  "custom/archicon" = {
    format = "󰣇";
    # "on-click":"nwg-menu -d -fm nemo -cmd-lock gtklock -va top",
    on-click = "jgmenu_run";
    tooltip = false;
  };
    };

    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    # CSS Styling
    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    style = ''
        * {
            font-family: "JetBrainsMono Nerd Font", FontAwesome, Roboto, Helvetica,
            Arial, sans-serif;
            font-size: 16px;
        }

        window#waybar {
            background-color: @background-hard-contrast;
            color: @foreground;
            transition-property: background-color;
            transition-duration: 0.5s;
            border-radius: 10px;
        }

        window#waybar.hidden {
            opacity: 0.2;
        }

        /*
        window#waybar.empty {
            background-color: transparent;
        }
        window#waybar.solo {
            background-color: #FFFFFF;
        }
        */

        /*window#waybar.termite {
            background-color: #3F3F3F;
        }
        window#waybar.chromium {
            background-color: #000000;
            border: none;
        }*/

        #workspaces button {
            box-shadow: inset 0 -3px transparent;
            padding: 0 8px;
            background-color: @background;
            color: @foreground;
            border: none;
            border-radius: 0;
            font-weight: 800;
        }

        #workspaces button:first-child {
            border-radius: 10px 0 0 10px;
        }

        #workspaces button:last-child {
            border-radius: 0 10px 10px 0;
        }

        /* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
        #workspaces button:hover {
            background: rgba(0, 0, 0, 0.2);
            background-color: @background-soft-contrast;
            /* box-shadow: inset 0 -100px 0 -97px @bright-yellow; */
        }

        #workspaces button.empty {
            color: @foreground-soft-contrast;
            box-shadow: inherit;
            text-shadow: inherit;
        }

        #workspaces button.active {
            color: @yellow;
            box-shadow: inset 0 -100px 0 -97px @bright-yellow;
            text-shadow: inherit;
        }

        #workspaces button.focused {
            background-color: @background-soft-contrast;
            color: @foreground;
            /* box-shadow: inset 0 -100px 0 -97px @bright-yellow; */
        }

        #workspaces button.urgent {
            background-color: @bright-red;
            color: @background;
        }

        #mode {
            background-color: @background-soft-contrast;
            border-bottom: 3px solid @yellow;
        }

        #cava,
        #clock,
        #battery,
        #cpu,
        #memory,
        #disk,
        #temperature,
        #backlight,
        #network,
        #pulseaudio,
        #pulseaudio.muted,
        #pulseaudio.bluetooth,
        #wireplumber,
        #custom-media,
        #tray,
        #mpris,
        #keyboard-state,
        #mode,
        #battery,
        #idle_inhibitor,
        #scratchpad,
        #mpd {
            padding: 0 10px;
            color: @foreground;
        }

        #window,
        #workspaces {
            margin: 0 4px;
            padding-top: 0px;
        }

        .modules-right {
            background-color: @background-soft-contrast;
            border-radius: 10px;
        }

        /* If workspaces is the leftmost module, omit left margin */
        .modules-left > widget:first-child > #workspaces {
            margin-left: 0;
        }

        /* If workspaces is the rightmost module, omit right margin */
        .modules-right > widget:last-child > #workspaces {
            margin-right: 0;
        }

        #mpris {
            color: @yellow;
        }

        #clock {
            color: @yellow;
        }

        #battery {
            color: @blue;
        }

        #battery.charging,
        #battery.plugged {
            color: #d3869b;
        }

        @keyframes blink {
            to {
                background-color: #fbf1c7;
                color: #df3f71;
            }
        }

        #battery.critical:not(.charging) {
            background-color: #282828;
            color: #d3869b;
            animation-name: blink;
            animation-duration: 0.5s;
            animation-timing-function: linear;
            animation-iteration-count: infinite;
            animation-direction: alternate;
        }

        label:focus {
            background-color: #000000;
        }

        #backlight {
            color: #458588;
        }

        #temperature {
            color: #fabd2f;
        }

        #temperature.critical {
            background-color: #fbf1c7;
            color: #b57614;
        }

        #cpu {
            color: @blue;
        }

        #memory {
            color: @magenta;
        }

        #network {
            color: @blue;
        }

        #network.disconnected {
            background-color: @bright-red;
            color: @background;
        }

        /*#disk {
            background-color: #964B00;
        }*/

        #pulseaudio,
        #pulseaudio.muted,
        #pulseaudio.bluetooth {
            color: @cyan;
        }

        #tray {
        }

        #tray > .needs-attention {
            background-color: @bright-red;
            color: @background;
        }

        #idle_inhibitor {
            background-color: #282828;
            color: #ebdbb2;
        }

        #idle_inhibitor.activated {
            background-color: #fbf1c7;
            color: #3c3836;
        }

        #custom-media {
            background-color: #66cc99;
            color: #2a5c45;
            min-width: 100px;
        }

        #custom-media.custom-spotify {
            background-color: #66cc99;
        }

        #custom-media.custom-vlc {
            background-color: #ffa000;
        }

        #mpd {
            background-color: #66cc99;
            color: #2a5c45;
        }

        #mpd.disconnected {
            background-color: #f53c3c;
        }

        #mpd.stopped {
            background-color: #90b1b1;
        }

        #mpd.paused {
            background-color: #51a37a;
        }

        #language {
            background: #00b093;
            color: #740864;
            padding: 0 5px;
            margin: 0 5px;
            min-width: 16px;
        }

        #keyboard-state {
            background: #97e1ad;
            color: #000000;
            padding: 0 0px;
            margin: 0 5px;
            min-width: 16px;
        }

        #keyboard-state > label {
            padding: 0 5px;
        }

        #keyboard-state > label.locked {
            background: rgba(0, 0, 0, 0.2);
        }

    '';
  };
}
