#!/bin/sh

# screenlayout setup for odin
autorandr -c

# start some nice programs
# if [ -d /etc/X11/xinit/xinitrc.d ] ; then
#     for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
#         # shellcheck source=/dev/null
#         [ -x "$f" ] && . "$f"
#     done
#     unset f
# fi

xset -b # disable bell

export SSH_AUTH_SOCK;
# export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
# ssh-agent -d &


# ssh agent setup
#eval `/usr/bin/ssh-agent`
#
#if test -f /usr/lib/openssh/x11-ssh-askpass # Archlinux
#then
#	SSH_ASKPASS=/usr/lib/openssh/x11-ssh-askpass ssh-add < /dev/null
#fi
#
#if test -f /usr/lib/ssh/x11-ssh-askpass # Debian
#then
#	SSH_ASKPASS=/usr/lib/ssh/x11-ssh-askpass ssh-add < /dev/null
#fi

# theming
export QT_QPA_PLATFORMTHEME=qt5ct
export DESKTOP_SESSION=plasma
export XDG_CURRENT_DESKTOP=dwm

# IMF configuration (fcitx5)
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export GLFW_IM_MODULE=ibus

# compositor
picom -b --vsync &

# fix android studio interface
export _JAVA_AWT_WM_NONREPARENTING=1 &

# set keyboard layout
setxkbmap pl &
# IMF daemon
# fcitx5 -d &

# enable local fonts in .fonts directory
# xset +fp /usr/share/fonts/local &
# xset +fp /usr/share/fonts/misc &
# xset +fp ~/.fonts &
# xset fp rehash &
# fc-cache -fv &

# powersaving options
# xset s off &
# xset s noblank &
# xset s noexpose &
# xset s on &
# xset -dpms &
# xset s 900 &
# Powersaving options
xset +dpms  # Enable DPMS
xset dpms 300 600 900  # Set DPMS timeouts (standby, suspend, off) in seconds

# Screen blanking
xset s on  # Enable screen blanking
xset s 600  # Set screen blanking timeout to 10 minutes (600 seconds)

# Host-specific rules
if [ "$(hostname)" = "zion" ]; then
    # Zion rules
    xautolock -time 5 -locker "brightnessctl -s set 10" &  # Set brightness to 10% after 5 minutes
    xautolock -time 10 -locker "loginctl lock-session" &   # Lock screen after 10 minutes
elif [ "$(hostname)" = "thor" ]; then
    # Thor rules
    xautolock -time 7.5 -locker "brightnessctl -s set 0" &  # Set brightness to 0% after 7.5 minutes
    xautolock -time 10 -locker "loginctl lock-session" &    # Lock screen after 10 minutes
    xautolock -time 12.5 -locker "xset dpms force off" &    # Turn off display after 12.5 minutes
    xautolock -time 15 -locker "systemctl suspend" &        # Suspend after 15 minutes
    xautolock -time 25 -locker "systemctl hibernate" &      # Hibernate after 25 minutes
fi

# auths
# /usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
# gnome-keyring-daemon &
# source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

## Map super key to trigger rofi when used alone
# xcape -e 'Super_L=Super_L|Shift_L|space' &

# wallpaper engine and theming
# nitrogen --restore &
# wal --backend colorz -i $HOME/.dots/nitrogen/.config/nitrogen/pexels-engin-akyurt-1435752.jpg &
. ~/.fehbg &

## Set screen locker
xss-lock -v -- betterlockscreen -l --time-format '%I:%M %p' &

## Desktop portal
/usr/lib/xdg-desktop-portal-gtk &

# notification daemon
dunst &

## Screenshot daemon
flameshot &

# Easyeffects daemon
# easyeffects --gapplication-service &

## Telegram daemon
# telegram-desktop -startintray &

## Caffeine-ng
# caffeine >/dev/null 2>&1 &

## Ulauncher
# ulauncher --hide-window --no-window-shadow >/dev/null 2>&1 &

# Emacs Server
# emacs --daemon &

# Theme changing service
# xsettingsd &

# Theming service
# dusk &

# Alacritty config
# $HOME/.config/alacritty/theme-patcher.sh &

## THINKPAD-SPECIFIC 
#hash dockd && dockd --daemon &

# status bar
bash $HOME/.config/bar.sh & disown

dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY

# . /etc/X11/Xsession

# redshift &

# some merges
# xrdb merge .Xresources &
# xsetroot -cursor_name left_ptr &

# start dwm
exec dwm

