#!/bin/sh

sketchybar --add item mic right \
    --set mic update_freq=3 \
    icon.font="$NERD_FONT:Regular:19.0" \
    label.font="$NERD_FONT:Heavy:12" \
    --set mic script="$PLUGIN_DIR/mic.sh" \
    --set mic click_script="$PLUGIN_DIR/mic_click.sh"

# sketchybar \
#     --add item docker right \
#     --set docker \
#     update_freq=10 \
#     label.padding_left=0 \
#     label.padding_right=0 \
#     icon.font="$NERD_FONT:Bold:16.0"   \
#     icon.padding_right=2 \
#     icon.y_offset=0 \
#     script="$PLUGIN_DIR/docker.sh" \
