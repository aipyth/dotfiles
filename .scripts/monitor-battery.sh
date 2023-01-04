#!/bin/bash

CHECK_PERIOD=1

LOW_BATTERY_MSG_SENT=0
CRIT_BATTERY_MSG_SENT=0
PLUGGED_NOTIFIED=0
UNPLUGGED_NOTIFIED=0

LOW_BATTERY_LEVEL=20
CRIT_BATTERY_LEVEL=5

expand_config() {
  LOW_BATTERY_MSG="Low battery level $CAPACITY%"
  LOW_BATTERY_MSG_URGENCY=low

  CRIT_BATTERY_MSG="Critical battery level $CAPACITY%"
  CRIT_BATTERY_MSG_URGENCY=critical

  PLUGGED_MSG="Charging battery..."
  PLUGGED_MSG_URGENCY=low

  UNPLUGGED_MSG="Discharging..."
  UNPLUGGED_MSG_URGENCY=low
}

while sleep $CHECK_PERIOD; do

  CAPACITY=$(cat /sys/class/power_supply/BAT0/capacity)
  STATUS=$(cat /sys/class/power_supply/BAT0/status)

  expand_config

  if [ $STATUS = Charging ] && [ $PLUGGED_NOTIFIED -eq 0 ]; then
    notify-send -u $PLUGGED_MSG_URGENCY "$PLUGGED_MSG" "$(acpi)"
    PLUGGED_NOTIFIED=1
    LOW_BATTERY_MSG_SENT=0
    CRIT_BATTERY_MSG_SENT=0
    continue
  fi

  if [ $STATUS = Discharging ] && [ $PLUGGED_NOTIFIED -eq 1 ]; then
    notify-send -u $UNPLUGGED_MSG_URGENCY -a System "$UNPLUGGED_MSG" "$(acpi)"
    PLUGGED_NOTIFIED=0
  fi

  if [ $CAPACITY -le $LOW_BATTERY_LEVEL ] && [ $LOW_BATTERY_MSG_SENT -eq 0 ]; then
    notify-send -u $LOW_BATTERY_MSG_URGENCY "$LOW_BATTERY_MSG" "$(acpi)"
    LOW_BATTERY_MSG_SENT=1
  elif [ $CAPACITY -gt $LOW_BATTERY_LEVEL ] && [ $LOW_BATTERY_MSG_SENT -eq 1 ]; then
    LOW_BATTERY_MSG_SENT=0
  fi

  if [ $CAPACITY -le $CRIT_BATTERY_LEVEL ] && [ $CRIT_BATTERY_MSG_SENT -eq 0 ] && [ $LOW_BATTERY_MSG_SENT -eq 1 ]; then
    notify-send -u $CRIT_BATTERY_MSG_URGENCY "$CRIT_BATTERY_MSG" "$(acpi)"
    CRIT_BATTERY_MSG_SENT=1
  elif [ $CAPACITY -gt $CRIT_BATTERY_LEVEL ] && [ $CRIT_BATTERY_MSG_SENT -eq 1 ]; then
    CRIT_BATTERY_MSG_SENT=0
  fi

done

