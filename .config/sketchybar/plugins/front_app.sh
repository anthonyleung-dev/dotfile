#!/bin/bash
# FRONT_APP_SCRIPT='sketchybar --set $NAME label="$(echo $INFO | awk '\''{print toupper(substr($0,1,1)) tolower(substr($0,2))}'\'')"'

if [ -z "$INFO" ]; then
    HAVE_INFO='off'
else
    HAVE_INFO='on'
fi

sketchybar --set "$NAME" label="$(echo $INFO | awk '{print toupper(substr($0,1,1)) tolower(substr($0,2))}')" label.drawing="$HAVE_INFO"
sketchybar --set apps background.drawing="$HAVE_INFO"
sketchybar --set app_spacer drawing="$HAVE_INFO" background.drawing=off width=8