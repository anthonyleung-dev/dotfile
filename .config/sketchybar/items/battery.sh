#!/bin/sh

sketchybar --add item battery right                             \
           --set battery script="$PLUGIN_DIR/battery.sh"        \
                         icon.font="$NERD_FONT:Regular:19.0"         \
                         label.font="$FONT:Heavy:12"            \
                         padding_right=5                        \
                         padding_left=0                         \
                         label.drawing=on                      \
                         update_freq=120                        \
                         updates=on                             \
            --subscribe battery power_source_change system_woke