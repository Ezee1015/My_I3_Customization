#!/bin/bash
music_file=""
file_count=0
pids=$(xdotool search --name "MPV - ")

for pid in $pids; do
  file_count=$(expr $file_count + 1)
  music_file=$(xdotool getwindowname $pid | cut -c 7-)
done

# Indicate if there's more than one file playing
if [ $file_count -gt 1 ]; then
  music_file="[$file_count] $music_file"
fi

# Cut music file name if it's too long
if [ ${#music_file} -gt 63 ]; then
  music_file="${music_file:0:60}..."
fi

# Put icon at the beginning if music is playing
if [ ! -z "$music_file" ]; then
  echo "♪ $music_file"
fi

# Mouse actions
case $BLOCK_BUTTON in
  1) # left click  - Pause music only if there's one mpv instance
    if [ $file_count -eq 1 ]; then
      xdotool search --name "MPV - " key space
    fi
    ;;
  2) # wheel click - Quit MPV
    if [ $file_count -eq 1 ]; then
      xdotool search --name "MPV - " key q
    fi
    ;;
  3) # right click - Focus window with mpv
    xdotool search --name "MPV - " windowactivate
    ;;
  4) # scroll up   - Increase volume of MPV
    if [ $file_count -eq 1 ]; then
      xdotool search --name "MPV - " key k
    fi
    ;;
  5) # scroll down - Decrease volume of MPV
    if [ $file_count -eq 1 ]; then
      xdotool search --name "MPV - " key j
    fi
    ;;
esac
