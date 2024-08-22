#!/bin/sh
source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/userconfig.sh"
# Get the current time for Hong Kong
HK_TIME=$(TZ="Asia/Hong_Kong" date "+%H:%M")
# Get the current time for Toronto
CA_TIME=$(TZ="America/Toronto" date "+%H:%M")

render_popup() {
    sketchybar -m --remove '/calendar.time\.*/'
    sketchybar -m --add item calendar.time.hk popup."$NAME" label.font="$FONT:Bold:14.0"
    sketchybar -m --set calendar.time.hk \
        label="Hong Kong: $HK_TIME" \
        label.font="$FONT:Bold:14.0" \
        label.color="$RED" \
        label.align=left \
        drawing=on \
        click_script="sketchybar --set $NAME popup.drawing=off"
    sketchybar -m --add item calendar.time.ca popup."$NAME"
    sketchybar -m --set calendar.time.ca \
        label="Toronto: $CA_TIME" \
        label.font="$FONT:Bold:14.0" \
        label.color="$PURPLE" \
        label.align=left \
        drawing=on \
        click_script="sketchybar --set $NAME popup.drawing=off"
}

update() {
    render_popup
    sketchybar --set $NAME icon="$(date '+%m/%d/%Y, %A')" label="$(date '+%H:%M')"

}

popup() {
    sketchybar --set "$NAME" popup.drawing=$1
}

# Main case block to handle different events
case "$SENDER" in
"routine" | "forced")
    update
    ;;
"mouse.entered")
    popup on
    ;;
"mouse.exited" | "mouse.exited.global")
    popup off
    ;;
"mouse.clicked")
    popup toggle
    ;;
esac
