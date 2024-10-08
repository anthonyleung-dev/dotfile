#!/usr/bin/env bash

source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/userconfig.sh"

BATT_PERCENT=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

render_bar_item() {
  sketchybar --set "${NAME}" icon.color=0xff989898

  if [[ ${CHARGING} != "" ]]; then
      case ${BATT_PERCENT} in
          100) ICON="󰂅" COLOR="$GREEN" ;;
          9[0-9]) ICON="󰂋" COLOR="$GREEN" ;;
          8[0-9]) ICON="󰂊" COLOR="$GREEN" ;;
          7[0-9]) ICON="󰢞" COLOR="$GREEN" ;;
          6[0-9]) ICON="󰂉" COLOR="$YELLOW" ;;
          5[0-9]) ICON="󰢝" COLOR="$YELLOW" ;;
          4[0-9]) ICON="󰂈" COLOR="$PEACH" ;;
          3[0-9]) ICON="󰂇" COLOR="$PEACH" ;;
          2[0-9]) ICON="󰂆" COLOR="$RED" ;;
          1[0-9]) ICON="󰢜" COLOR="$RED" ;;
          *) ICON="󰂅"  COLOR="$RED" ;;
      esac

    sketchybar --set "${NAME}" icon="${ICON}" icon.color="${COLOR}"
    sketchybar --set "${NAME}" label="${BATT_PERCENT}%" label.font="$FONT:Bold:14.0"
    
    # low_battery_label 
    return 0
  fi

  case ${BATT_PERCENT} in
      100) ICON="󰁹" COLOR="$GREEN" ;;
      9[0-9]) ICON="󰂂" COLOR="$GREEN" ;;
      8[0-9]) ICON="󰂁" COLOR="$GREEN" ;;
      7[0-9]) ICON="󰂀" COLOR="$GREEN" ;;
      6[0-9]) ICON="󰁿" COLOR="$YELLOW" ;;
      5[0-9]) ICON="󰁾" COLOR="$YELLOW" ;;
      4[0-9]) ICON="󰁽" COLOR="$PEACH" ;;
      3[0-9]) ICON="󰁼" COLOR="$PEACH" ;;
      2[0-9]) ICON="󰁻" COLOR="$RED" ;;
      1[0-9]) ICON="󰁺" COLOR="$RED" ;;
      *) ICON="󰁹"  COLOR="$RED" ;;
  esac

  sketchybar --set "${NAME}" icon="${ICON}" icon.color="${COLOR}"

  # low_battery_label 
}

low_battery_label() {
  if [[ "$BATT_PERCENT" -lt 50 ]]; then 
          sketchybar --set "${NAME}" label="${BATT_PERCENT}%"
  else 
          sketchybar --set "${NAME}" label.drawing=off
  fi
}

update() {
  render_bar_item
}

popup() {
  if [[ "$BATT_PERCENT" -gt 50 ]]; then         
    sketchybar --set "$NAME" popup.drawing="$1"
  else 
    sketchybar --set "$NAME" popup.drawing=off
  fi
}

case "$SENDER" in
  "routine"|"forced") update
  ;;
  "mouse.entered") popup on
  ;;
  "mouse.exited"|"mouse.exited.global") popup off
  ;;
  "mouse.clicked") popup toggle
  ;;
esac
