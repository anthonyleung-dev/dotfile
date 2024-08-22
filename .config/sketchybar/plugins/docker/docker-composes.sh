#!/bin/bash

# Initialize arrays to hold the project names and corresponding services
project_names=()
services_list=()

# Get a list of all Docker containers filtered by the Docker Compose project label
containers=$(docker ps --filter "label=com.docker.compose.project" --format "{{.Names}}")

# Function to find common prefix
common_prefix() {
  prefix="$1"
  for name in "${@:2}"; do
    while [[ "$name" != "$prefix"* ]]; do
      prefix="${prefix%-*}"
    done
  done
  echo "$prefix"
}

# Process each container name to find its prefix and service name
for container in $containers; do
  # Extract the project name by removing the last two components (e.g., "-service-1")
  project_name=$(echo "$container" | rev | cut -d'-' -f3- | rev)
  service_name=$(echo "$container" | rev | cut -d'-' -f2 | rev)

  # Check if project_name already exists in project_names array
  found=0
  for i in "${!project_names[@]}"; do
    if [[ "${project_names[$i]}" == "$project_name" ]]; then
      services_list[$i]+=", $service_name"
      found=1
      break
    fi
  done

  # If the project_name was not found, add it
  if [[ $found -eq 0 ]]; then
    project_names+=("$project_name")
    services_list+=("$service_name")
  fi
done

# Output the grouped containers in the desired format
# echo "Groups:"
for i in "${!project_names[@]}"; do
  echo "${project_names[$i]} [${services_list[$i]}]"
done
