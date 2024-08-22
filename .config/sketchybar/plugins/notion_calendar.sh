#!/bin/bash

# Run the AppleScript and capture the output
output=$(osascript $HOME/.config/sketchybar/plugins/notion_calendar/get_notion_calendar_items.scpt)


if [ -z "$output" ]; then
    output="No Upcoming Events"
fi

sketchybar --set $NAME label="$output"