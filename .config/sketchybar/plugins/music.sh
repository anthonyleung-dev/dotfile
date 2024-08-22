#!/bin/bash
source ~/.config/sketchybar/colors.sh

# Get the playback state from INFO
STATE="$(echo "$INFO" | jq -r '.state')"

# Define Nerd Font icons for applications
SPOTIFY_ICON="󰓇"
YOUTUBE_ICON=""
APPLEMUSIC_ICON=""
BROWSER_ICON="󰖟"
OTHER_ICON="󰎆"

SPOTIFY_COLOR="0xff1DB954" # #1DB954
YOUTUBE_COLOR="0xffFF0000" # #FF0000
APPLEMUSIC_COLOR="0xffFF2D55" # #FF2D55
BROWSER_COLOR="$BLUE"
OTHER_COLOR="$BLUE"

# If the media is playing
if [ "$STATE" = "playing" ]; then
	# Extract application name, title, and artist from INFO
	APP_NAME="$(echo "$INFO" | jq -r '.app')"
	TITLE="$(echo "$INFO" | jq -r '.title')"
	ARTIST="$(echo "$INFO" | jq -r '.artist')"
	MEDIA="$TITLE - $ARTIST"

	# Choose the appropriate icon based on the application name
	case "$APP_NAME" in
	"Spotify")
		ICON="$SPOTIFY_ICON"
		ICON_COLOR="$SPOTIFY_COLOR"
		;;
	"YouTube Music")
		ICON="$YOUTUBE_ICON"
		ICON_COLOR="$YOUTUBE_COLOR"
		;;
	"Apple Music")
		ICON="$APPLEMUSIC_ICON"
		ICON_COLOR="$APPLEMUSIC_COLOR"
		;;
	"Arc")
		ICON="$YOUTUBE_ICON"
		ICON_COLOR="$YOUTUBE_COLOR"
		;;
	"Chrome")
		ICON="$YOUTUBE_ICON"
		ICON_COLOR="$YOUTUBE_COLOR"
		;;
	*)
		ICON="$OTHER_ICON"
		ICON_COLOR="$OTHER_COLOR"
		;;
	esac

	# Update sketchybar with the icon and media information
	sketchybar --set $NAME icon="$ICON" icon.color="$ICON_COLOR" label="$MEDIA" drawing=on
else
	# Hide the icon and information if nothing is playing
	sketchybar --set $NAME drawing=off
fi
