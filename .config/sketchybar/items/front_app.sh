#!/bin/bash
sketchybar --add item front_app left \
    --set front_app \
    padding_left=0 \
    padding_right=6 \
    label.color="$TEXT" \
    label.font="$FONT:Bold:14.0" \
    icon.background.drawing=on \
    display=active \
    script="$PLUGIN_DIR/front_app.sh" \
    click_script="open -a 'Mission Control'" \
    --subscribe front_app front_app_switched

sketchybar --add bracket apps front_app \
    --set apps background.color=$OP_SKY \
    background.drawing=off \
    background.border_width=2

sketchybar \
    --add item app_spacer left \
    --set app_spacer background.drawing=off \
    width=8
