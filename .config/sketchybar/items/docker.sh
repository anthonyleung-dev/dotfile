#!/usr/bin/env sh

# Trigger the docker_udpate event when docker update or upgrade is run from cmdline
# e.g. via function in .zshrc or fish function

POPUP_CLICK_SCRIPT="sketchybar --set docker popup.drawing=toggle"

sketchybar --add event docker_update \
	--add item docker right \
	--set docker \
	script="$PLUGIN_DIR/docker.sh" \
	click_script="$POPUP_CLICK_SCRIPT" \
	padding_left=0 \
	padding_right=0 \
	icon= \
	icon.font="$NERD_FONT:Bold:20.0" \
	icon.color="0x0fffffff" \
	update_freq=10 \
	popup.align=right \
	popup.height=25 \
	popup.padding_right=10 \
	--subscribe docker docker_update \
	mouse.entered \
	mouse.exited \
	mouse.exited.global
