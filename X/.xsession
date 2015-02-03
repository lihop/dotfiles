#!/bin/sh
#
# ~/.xinitrc
#

# set keyboard layout
setxkbmap dvp

# use Xresources
xrdb ~/.Xresources

# load custom modmap from ~/.Xmodmap
if [ -s ~/.Xmodmap ]; then
    xmodmap ~/.Xmodmap
fi

# use sxhkd
sxhkd &

# default cursor
xsetroot -cursor_name left_ptr

# xrandr setup
xrandr --output DFP5 --auto --right-of DFP7
xrandr --output DFP7 --auto --rotate right

exec dbus-launch xmonad 


