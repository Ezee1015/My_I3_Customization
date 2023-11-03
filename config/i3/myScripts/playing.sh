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
