#!/bin/sh

sketchybar --add slider volume right \
    --set volume script="$PLUGIN_DIR/volume.sh" \
    updates=on \
    icon.drawing=off \
    label.drawing=off \
    padding_left=0 \
    label.padding_right=0 \
    slider.highlight_color=$PEACH \
    slider.background.height=5 \
    slider.background.corner_radius=3 \
    slider.background.color=$BACKGROUND_2 \
    slider.knob=􀀁 \
    --subscribe volume volume_change mouse.clicked

sketchybar --add alias "Control Centre,Sound" right \
    --rename "Control Centre,Sound" volume_alias \
    --set volume_alias icon.drawing=off \
    label.drawing=off \
    y_offset=-1 \
    alias.color=$WHITE \
    padding_right=0 \
    padding_left=10 \
    align=right \
    click_script="$PLUGIN_DIR/volume_click.sh"

sketchybar --add bracket status brew volume volume_alias \
    --set status background.color=$OP_SAPPHIRE \
    background.border_color=$BACKGROUND_2 \
    background.border_width=2 
