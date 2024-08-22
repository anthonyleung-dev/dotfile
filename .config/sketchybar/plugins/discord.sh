#!/usr/bin/env sh
STATUS_LABEL=$(lsappinfo info -only StatusLabel "Discord")
IS_OPEN=$(lsappinfo list | grep -q "Discord")
ICON=""
LABEL=""

if [[ $STATUS_LABEL ]]; then
    ICON_COLOR="0xff7289da"
else
    ICON_COLOR="0x0fffffff"
fi

if [[ $STATUS_LABEL =~ \"label\"=\"([^\"]*)\" ]]; then
    LABEL="${BASH_REMATCH[1]}"
fi

sketchybar --set $NAME icon=$ICON label="${LABEL}" icon.color=${ICON_COLOR}
