#!/bin/bash
music_file=""
pids=$(xdotool search --name "MPV - ")
file_count=$(xdotool search --name "MPV - " | wc -l)

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

# Search for MPV names
for pid in $pids; do
  music_file=$(xdotool getwindowname $pid | cut -c 7-)
done

# Put a music icon at the beginning if music is playing and it's not paused
if [ ! -z "$music_file" ] & [ "$(echo $music_file | awk '{print $1}')" != "󰐎" ]; then
  music_file="♪  $music_file"
fi

# Indicate if there's more than one file playing
if [ $file_count -gt 1 ]; then
  music_file="[$file_count] $music_file"
fi

# Cut music file name if it's too long
if [ ${#music_file} -gt 63 ]; then
  echo "${music_file:0:60}..."
else
  echo "$music_file"
fi
