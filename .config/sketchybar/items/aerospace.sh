#!/bin/sh
source "$HOME/.config/sketchybar/colors.sh"
sketchybar --add event aerospace_workspace_change

icon=('' '󰖟' '󰭹' '' '󰙵' '󰎆' '' '' '')
color=($GREEN, $RED, $TEAL, $OVERLAY0, $FLAMINGO, $GREEN, $YELLOW, $SAPPHIRE, $PEACH)

index=0
for sid in $(aerospace list-workspaces --all); do
  sketchybar --add item space.$sid left \
    --subscribe space.$sid aerospace_workspace_change \
    --set space.$sid \
    background.color=0x44ffffff \
    background.corner_radius=5 \
    background.height=20 \
    background.drawing=off \
    icon.font="$NERD_FONT:Bold:18.0" \
    icon="${icon[$index]}" \
    icon.color=$TEXT2 \
    icon.highlight_color=${color[$index]} \
    click_script="aerospace workspace $sid" \
    script="$CONFIG_DIR/plugins/aerospace.sh $sid"
  index=$((index + 1))
done
