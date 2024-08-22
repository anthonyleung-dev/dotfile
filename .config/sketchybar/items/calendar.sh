#!/usr/bin/env sh

# Trigger the show_time event when calendar update or upgrade is run from cmdline
# e.g. via function in .zshrc or fish function

POPUP_CLICK_SCRIPT="sketchybar --set calendar popup.drawing=toggle"

sketchybar --add event show_time \
	--add item calendar right \
	--set calendar \
	script="$PLUGIN_DIR/calendar.sh" \
	click_script="$POPUP_CLICK_SCRIPT" \
	icon.font="$FONT:Black:14.0" \
    icon.padding_right=0 \
    icon.color=$PEACH \
    label.width=50 \
    label.align=right \
    label.color=$OVERLAY2 \
	label.font="$FONT:Bold:14.0" \
    padding_left=0 \
	update_freq=10 \
	popup.align=right \
	popup.height=22 \
	--subscribe calendar show_time \
	mouse.entered \
	mouse.exited \
	mouse.exited.global