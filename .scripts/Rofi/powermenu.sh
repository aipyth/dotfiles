#!/usr/bin/env bash

# Determine `systemd-logind` or `(e)logind`.
if [ -x "$(command -v systemctl)" ]; then
    SEATCTL='systemctl'
elif [ -x "$(command -v loginctl)" ]; then
    SEATCTL='loginctl'
else
    echo "failed"
fi

# ROFI="rofi -theme .scripts/Rofi/themes/five-horizontal.rasi"
ROFI="rofi"

# A='' B='' C='' D='' E=''
A='Poweroff' B='Reboot' D='Suspend' E='Logout'

# MENU="$(printf "${A}\n${B}\n${C}\n${D}\n${E}\n" | ${ROFI} -dmenu -selected-row 2)"
MENU="$(printf "${A}\n${B}\n${D}\n${E} " | ${ROFI} -dmenu 4)"

case "$MENU" in
    # "$A") exec "${HOME}/.scripts/Rofi/promptmenu.sh" \
    #           --yes-command "${SEATCTL} poweroff"  \
    #           -q ' poweroff?'
    "$A") exec ${SEATCTL} poweroff

    ;;
    # "$B") exec "${HOME}/.scripts/Rofi/promptmenu.sh" \
    #           --yes-command "${SEATCTL} reboot"    \
    #           --query '  reboot?'
    "$B") exec ${SEATCTL} reboot
    ;;
    "$C") betterlockscreen -l
    ;;
    # "$D") if [[ "$("$MUSIC_CONTROLLER" status)" = *'laying'* ]]; then
    #           "$MUSIC_CONTROLLER" toggle
    #       fi
    #       exec "$SEATCTL" suspend
    "$D") exec "$SEATCTL" suspend
    ;;
    # "$E") exec "${HOME}/.scripts/Rofi/promptmenu.sh"               \
    #           --yes-command "pkill -KILL -u $(id -nu || whoami)" \
    #           -q '  Logout?'
    "$E") exec bspc quit
    ;;
esac 

exit ${?}
