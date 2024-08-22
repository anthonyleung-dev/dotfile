#!/bin/sh
if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
	sketchybar --animate tanh 20 --set $NAME icon.highlight=true 
else
	sketchybar --animate tanh 20 --set $NAME icon.highlight=false
fi
