#!/bin/bash

# if [ "$1" == "inc" ]; then
#     brightnessctl -s set +2%
# fi
#
# if [ "$1" == "dec" ]; then
#     brightnessctl -s set 2%-
# fi

BRIGHTNESS=$(brightnessctl g)
MAX=$(brightnessctl m)
PERCENT=$(calc $BRIGHTNESS / $MAX )
# NOTI_ID=$(notify-send.py "Bildschirmhelligkeit" "$BRIGHTNESS/$MAX" --hint string:image-path:video-display boolean:transient:true int:has-percentage:$BRIGHTNESS --replaces-process "brightness-popup")

notify-send.py "Bildschirmhelligkeit" "$BRIGHTNESS/$MAX" --hint string:image-path:video-display boolean:transient:true int:has-percentage:$BRIGHTNESS --replaces-process "brightness-popup"
# notify-send.py "Bildschirmhelligkeit" "$BRIGHTNESS/$MAX" --hint string:image-path:video-display boolean:transient:true int:has-percentage:$BRIGHTNESS
echo "end"

exit 0
