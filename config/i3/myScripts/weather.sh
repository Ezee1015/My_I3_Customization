curl -Ss 'https://wttr.in?0&T&Q' | cut -c 16- | head -2 | xargs echo

case $BLOCK_BUTTON in
  1) xdg-open "https://www.accuweather.com/es/ar/saavedra/1228300/weather-forecast/1228300";; # left click
esac
