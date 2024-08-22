#!/bin/sh

sketchybar \
    --add item telegram right \
    --set telegram \
    update_freq=10 \
    label.font="$FONT:Heavy:12" \
    icon.font="$NERD_FONT:Bold:16.0" \
    icon.y_offset=0 \
    script="$PLUGIN_DIR/telegram.sh" \
    click_script="open -a 'Telegram'" \
