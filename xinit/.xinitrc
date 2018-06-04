#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Fonts
xset +fp /home/zane/.fonts
xset fp rehash
xrandr --dpi 96

# Turn off DPMS on monitor
xset dpms 300 300 300

# Set key repeat rate
xset r rate 200 25

# Start xbindkeys daemon
xbindkeys

# Start xautolock
xautolock -detectsleep \
    -notify     30  -notifier   "xset dpms force off" \
    -time       5   -locker     "/usr/bin/slock" \
    -killtime   30  -killer     "systemctl hibernate" &

# Start unclutter daemon
unclutter &

# Start dwm status bar daemon
/usr/local/bin/statusbar &

# Set wallpaper
$HOME/.fehbg &

# Start dwm
exec $HOME/bin/startdwm
