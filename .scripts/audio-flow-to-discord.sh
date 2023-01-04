#!/bin/bash
MIC_NAME=alsa_input.usb-Razer_Razer_Thresher_7.1_3430323032374430-00.analog-stereo
OUTPUT_NAME=alsa_output.usb-Razer_Razer_Thresher_7.1_3430323032374430-00.analog-stereo
pactl load-module module-null-sink sink_name=Virtual1
# pactl load-module module-loopback source=$MIC_NAME sink=Virtual1
pactl load-module module-loopback source=Virtual1.monitor sink=$OUTPUT_NAME

pactl load-module module-null-sink sink_name=FromMic
pactl load-module module-loopback source=$MIC_NAME sink=FromMic
