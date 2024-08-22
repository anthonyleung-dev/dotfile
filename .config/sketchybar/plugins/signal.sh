#!/usr/bin/env sh
STATUS_LABEL=$(lsappinfo info -only StatusLabel "Signal")
IS_OPEN=$(lsappinfo list | grep -q "Signal")
ICON="󰭹"
LABEL=""

if [[ $STATUS_LABEL ]]; then
    ICON_COLOR="0xff3a76f0" # #3a76f0
else
    ICON_COLOR="0x0fffffff"
fi

if [[ $STATUS_LABEL =~ \"label\"=\"([^\"]*)\" ]]; then
    LABEL="${BASH_REMATCH[1]}"
fi

sketchybar --set $NAME icon=$ICON label="${LABEL}" icon.color=${ICON_COLOR}
