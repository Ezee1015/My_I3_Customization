#!/bin/sh

volume=$(amixer sget Master | awk -F"[][]" '/Left:/ { print $2 }')
dunstify -a "Volumen Sonido" -u low -r 9993 -h int:value:"$volume" -i "audio-on" "Volume: " -t 2000
