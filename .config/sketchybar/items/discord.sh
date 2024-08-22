#!/bin/sh

sketchybar \
    --add item discord right \
    --set discord \
    update_freq=10 \
    label.font="$FONT:Heavy:12" \
    icon.font="$NERD_FONT:Bold:16.0" \
    icon.y_offset=0 \
    padding_left=10 \
    script="$PLUGIN_DIR/discord.sh" \
    click_script="open -a 'Discord'" \
