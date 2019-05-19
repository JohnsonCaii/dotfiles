#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

export _JAVA_AWT_WM_NONREPARENTING=1
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"


if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

if [ -f $HOME/.Xmodmap ]; then
    /usr/bin/xmodmap $HOME/.Xmodmap
fi

# xinput set-prop 8 154 2.400000, 0.000000, 0.000000, 0.000000, 2.400000, 0.000000, 0.000000, 0.000000, 1.000000

if [ -f $HOME/.Xresources ]; then
    xrdb $HOME/.Xresources
fi

xsetroot -cursor_name left_ptr

# xrandr --output VGA1 --primary --right-of LVDS1 --mode 1680x1050 --output LVDS1 --mode 1366x768 &

xcompmgr -Ss -n -Cc -fF -I-10 -O-10 -D1 -t-3 -l-4 -r4 &

syndaemon -t -k -i 2 -d &

# exec gnome-session-cinnamon
# exec gnome-session-xmonad
# exec ck-launch-session xmonad
exec i3
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
