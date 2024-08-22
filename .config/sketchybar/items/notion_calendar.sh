#!/usr/bin/env sh

sketchybar \
    --add item notion_calendar right \
    --set notion_calendar \
    update_freq=10 \
    label.font="$FONT:Bold:14" \
    label.padding_right=10 \
	icon=󰃭 \
    icon.color=$PURPLE \
    icon.font="$NERD_FONT:Bold:16.0" \
    icon.y_offset=0 \
    padding_left=10 \
    script="$PLUGIN_DIR/notion_calendar.sh" \
