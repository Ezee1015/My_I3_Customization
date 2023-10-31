#!/usr/bin/env python3

# Reproduce a sound depending on if the notifications are enabled or disable

import os
import subprocess as sp

def isMuted():
    output = sp.check_output(('dunstctl', 'is-paused'))
    return u'true' ==  output.strip().decode("UTF-8")


if isMuted():
    sound_file = os.path.expanduser("~/.config/i3/sounds/notificacion-off.ogg")
else:
    sound_file = os.path.expanduser("~/.config/i3/sounds/notificacion-on.ogg")

sp.run(["ffplay", sound_file, "-autoexit", "-nodisp", "-loglevel", "quiet"], check=True)
