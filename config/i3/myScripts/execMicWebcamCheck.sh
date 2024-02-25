if [ -z "$(ps -axo comm | grep "micCheck.sh")" ]; then
  ~/github/My_Scripts/sh/mic-webcam-check/micCheck.sh ;
fi

if [ -z "$(ps -axo comm | grep "webcamCheck.sh")" ]; then
  ~/github/My_Scripts/sh/mic-webcam-check/webcamCheck.sh ;
fi
