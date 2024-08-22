#!/bin/bash

# Get all running containers
all_containers=$(docker ps --format "{{.Names}} {{.ID}} {{.Status}}")
# Get containers with the specific label
containers_with_label=$(docker ps --filter "label=com.docker.compose.project" --format "{{.ID}}")

in_array() {
  local id="$1"
  shift
  local array=("$@")
  for i in "${!array[@]}"; do
    if [[ "${array[$i]}" == "$id" ]]; then
      return 0
    fi
  done
  return 1
}
# Create an array to hold the IDs of labeled containers
labeled_ids=()
while IFS= read -r line; do
  labeled_ids+=("$line")
done <<<"$containers_with_label"

# Print the IDs and names of the containers that don't have the label
echo "$all_containers" | while read -r name id status; do
  if ! in_array "$id" "${labeled_ids[@]}"; then
    echo "$id - $name ($status)"
  fi
done
