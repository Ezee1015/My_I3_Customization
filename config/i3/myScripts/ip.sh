#!/bin/bash

IP=$(ip address | grep 192.168 | awk '{print $2}' | sed 's/\(.*\)\/.*/  \1/')
HIDDEN=$(echo "$IP" | sed 's/[0-9]/*/g')

if [[ "$(dunstctl is-paused)" == "false" ]]; then
  echo "$IP"
else
  echo "$HIDDEN"
fi
