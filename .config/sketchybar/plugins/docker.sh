#!/usr/bin/env bash

source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/userconfig.sh"
source "$HOME/.config/sketchybar/icons.sh"

# Function to check if Docker is running via a specific socket
is_docker_running() {
  local socket="$1"
  export DOCKER_HOST="unix://$socket"
  curl -s --unix-socket "$socket" http/_ping >/dev/null 2>&1
}

# Function to determine which Docker socket to use
determine_docker_socket() {
  if is_docker_running "$HOME/.colima/default/docker.sock"; then
    echo "$HOME/.colima/default/docker.sock"
  elif is_docker_running "/var/run/docker.sock"; then
    echo "/var/run/docker.sock"
  else
    echo ""
  fi
}

# Function to render the bar item (summary information in the bar)
render_docker_compose_status() {
  sketchybar -m --remove '/docker.compose\.*/'

  local COUNTER=0
  local output
  output=$($HOME/.config/sketchybar/plugins/docker/docker-composes.sh)

  sketchybar -m --add item docker.compose.title popup."$NAME"
  sketchybar -m --set docker.compose.title \
    label="Docker Composes: " \
    label.align=center \
    label.color="$BLUE" \
    label.font="$FONT:Bold:16.0" \
    click_script="sketchybar --set $NAME popup.drawing=off"

  while IFS= read -r compose; do
    sketchybar -m --add item docker.compose."$COUNTER" popup."$NAME"

    sketchybar -m --set docker.compose."$COUNTER" \
      label="$compose" \
      label.color="$RED" \
      label.font="$FONT:Regular:14.0" \
      label.align=center \
      click_script="sketchybar --set $NAME popup.drawing=off"

    COUNTER=$((COUNTER + 1))
  done <<<"$output"

  if [ "$COUNTER" -eq 0 ]; then
    sketchybar -m --set docker.compose.title \
      label="No Docker Composes" \
      label.align=center \
      click_script="sketchybar --set $NAME popup.drawing=off"
  fi

}

render_docker_status() {
  sketchybar -m --remove '/docker.container\.*/'

  local COUNTER=0
  local containeroutput
  containeroutput=$($HOME/.config/sketchybar/plugins/docker/containers.sh)
  sketchybar -m --add item docker.container.title popup."$NAME"
  sketchybar -m --set docker.container.title \
    label="Docker Containers" \
    label.align=center \
    label.color="$GREEN" \
    label.font="$FONT:Bold:16.0" \
    click_script="sketchybar --set $NAME popup.drawing=off"

  while IFS= read -r container; do
    sketchybar -m --add item docker.container."$COUNTER" popup."$NAME"
    sketchybar -m --set docker.container."$COUNTER" \
      label="$container" \
      label.color="$RED" \
      label.font="$FONT:Regular:14.0" \
      label.align=center \
      click_script="sketchybar --set $NAME popup.drawing=off"

    COUNTER=$((COUNTER + 1))
  done <<<"$containeroutput"
}

# Update function to refresh the status
update() {
  local socket
  socket=$(determine_docker_socket)

  if [ -n "$socket" ]; then
    export DOCKER_HOST="unix://$socket"
    DOCKER_COUNT=$(docker ps -q | wc -l | xargs)
    DOCKER_LIST=$(docker container ls --format "{{.ID}} - {{.Image}} ({{.Status}})")
    render_docker_compose_status
    render_docker_status
    sketchybar --set "$NAME" icon=
    sketchybar --set "$NAME" icon.color="0xff0db7ed"
    # sketchybar --set "$NAME" label="$DOCKER_COUNT"
    # sketchybar --set "$NAME" padding_right=15
  else
    sketchybar --set "$NAME" icon=
    sketchybar --set "$NAME" icon.color="0x0fffffff"
    sketchybar --set "$NAME" label=""
  fi
}

# Function to handle popup visibility
popup() {
  local socket
  socket=$(determine_docker_socket)
  DOCKER_COUNT=$(docker ps -q | wc -l | xargs)
  if [ -n "$socket" ] && [ $DOCKER_COUNT -gt 0 ]; then
    sketchybar --set "$NAME" popup.drawing="$1"
  else
    sketchybar --set "$NAME" popup.drawing=off
  fi
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
