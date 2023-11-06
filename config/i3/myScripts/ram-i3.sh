if [ -z $TRESSHOLD ]; then
  TRESSHOLD=$(free | grep Mem | awk '{print $2/2}')=
  echo "set"
fi

if [ -z $COLOR ]; then
  COLOR="#33ff33"
fi

HTML_COLOR="<span color=\"$COLOR\">"
HTML_COLOR_END='</span>'

FREE_HUMAN=$(free -h | grep Mem | awk '{print $3}')
FREE_BYTES=$(free | grep Mem | awk '{print $3}')

if [ $FREE_BYTES -gt $TRESSHOLD ]; then
  echo "$HTML_COLOR$LABEL  $FREE_HUMAN$HTML_COLOR_END"
else
  echo "$LABEL  $FREE_HUMAN"
fi
