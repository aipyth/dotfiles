#! /bin/sh
MONITORS=$(xrandr -q | grep " connected" | wc -l)
# echo $MONITORS
# feh --bg-center --bg-fill $(find $(cat /home/john/.WALLPAPERS_DIR) f | shuf -n $MONITORS)
wpg -m
