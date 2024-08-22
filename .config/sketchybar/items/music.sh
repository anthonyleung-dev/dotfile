#!/usr/bin/env sh

media=(
  script="$PLUGIN_DIR/music.sh"
  updates=on
  icon.font="$NERD_FONT:Bold:16.0"
)

sketchybar --add item music left \
           --set music "${media[@]}" \
           --subscribe music media_change
