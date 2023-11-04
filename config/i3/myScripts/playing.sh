music_file=""
file_count=0
pids=$(xdotool search --name "MPV - ")

for pid in $pids; do
  file_count=$(expr $file_count + 1)
  music_file=$(xdotool getwindowname $pid | cut -c 7-)
done

if [ $file_count -gt 1 ]; then
  music_file="[$file_count] $music_file"
fi

if [ ${#music_file} -gt 63 ]; then
  music_file="${music_file:0:60}..."
fi

if [ ! -z "$music_file" ]; then
  echo "♪ $music_file"
fi

case $BLOCK_BUTTON in
  1) # left click  - Pause music only if there's one mpv instance
    if [ $file_count -eq 1 ]; then
      xdotool search --name "MPV - " key space
    fi
    ;;
  3) # right click - Focus window with mpv
    xdotool search --name "MPV - " windowactivate
    ;;
esac
