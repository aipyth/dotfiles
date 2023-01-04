#!/usr/bin/env bash

killall -9 polybar

# polybar main -c $HOME/.config/polybar/config

polybar primary -c $HOME/.config/polybar/config &
polybar secondary -c $HOME/.config/polybar/config &
