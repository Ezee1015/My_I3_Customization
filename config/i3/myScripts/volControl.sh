#!/bin/sh

volume=$(amixer sget Master | awk -F"[][]" '/Left:/ { print $2 }')
dunstify -a "Script de Volumen" -u low -r 9993 -h int:value:"$volume" -i "audio-on" "Volumen: " -t 2000
