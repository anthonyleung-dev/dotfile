#!/usr/bin/env bash

#
# Custom color palette based on provided image
#

# Base background colors (from the darker tones in the image)
export BASE=0xff1A1E23      # Dark gray from shadows (#1A1E23)
export OP_MANTLE=0xea2C3038 # Mid-dark gray from building shadows (#2C3038)
export MANTLE=0xff2C3038    # Mid-dark gray from building shadows (#2C3038)
export CRUST=0xff3E4450     # Slightly lighter gray from building shadows (#3E4450)

# Text colors (lighter tones from the image)
export TEXT=0xffD4BC99     # Light beige from windows/reflections (#D4BC99)
export TEXT2=0xffDCD7C9     # Light beige from windows/reflections (#D4BC99)
export SUBTEXT0=0xffB8B2A3 # Soft gray-beige from lighter building parts (#B8B2A3)
export SUBTEXT1=0xff9A9483 # Slightly darker beige from walls (#9A9483)

# Surface colors (from building surfaces)
export SURFACE0=0xff4F5462 # Gray-blue from building shadows (#4F5462)
export SURFACE1=0xff656D7C # Gray with a hint of blue from building surfaces (#656D7C)
export SURFACE2=0xff7C8494 # More vibrant gray-blue (#7C8494)

# Overlay colors (from the image's more vivid parts)
export OVERLAY0=0xffB88C62 # Warm beige from sunlit building parts (#B88C62)
export OVERLAY1=0xffC5A77E # Warmer beige from sunlit areas (#C5A77E)
export OVERLAY2=0xffD4BC99 # Very light beige from reflections (#D4BC99)

# Highlight colors (vivid colors from the image)
export BLUE=0xff5A88B0      # Blue from the sky reflections (#5A88B0)
export LAVENDER=0xff8A94B8  # Soft lavender from window reflections (#8A94B8)
export OP_LAVENDER=0xaa8A94B8  # Soft lavender from window reflections (#8A94B8)
export SAPPHIRE=0xff4F6B88  # Deep blue from shaded areas (#4F6B88)
export OP_SAPPHIRE=0xaa4F6B88  # Deep blue from shaded areas (#4F6B88)
export SKY=0xff6A91B9       # Sky blue from brighter sky reflections (#6A91B9)
export OP_SKY=0x6c6A91B9       # Sky blue from brighter sky reflections (#6A91B9)
export TEAL=0xff5A8A84      # Teal from a mix of greenish reflections (#5A8A84)
export OP_TEAL=0xaa5A8A84      # Teal from a mix of greenish reflections (#5A8A84)
export GREEN=0xff7A9B64     # Green from plants or foliage in the image (#7A9B64)
export OP_GREEN=0xaa7A9B64     # Green from plants or foliage in the image (#7A9B64)
export YELLOW=0xffE5B76C    # Yellow from signage or sunlit areas (#E5B76C)
export OP_YELLOW=0xaaE5B76C    # Yellow from signage or sunlit areas (#E5B76C)
export PEACH=0xffD0855A     # Peach-orange from the reddish signs (#D0855A)
export OP_PEACH=0xaaD0855A     # Peach-orange from the reddish signs (#D0855A)
export MAROON=0xffA65842    # Maroon from darker red elements in the signs (#A65842)
export OP_MAROON=0xaaA65842    # Maroon from darker red elements in the signs (#A65842)
export RED=0xffD06348       # Red from the vivid signs (#D06348)
export MAUVE=0xff7A5A68     # Mauve from some of the shadowed areas (#7A5A68)
export PINK=0xffD89A9C      # Pink from faded elements in the image (#D89A9C)
export FLAMINGO=0xffE09D82  # Lighter pink from sunlit areas (#E09D82)
export ROSEWATER=0xffF0D1C2 # Very light pink-beige from soft reflections (#F0D1C2)
export PURPLE=0xff8A6A8C    # Purple from the vivid signs (#8A6A8C)

export RANDOM_CAT_COLOR=("$BLUE" "$LAVENDER" "$SAPPHIRE" "$SKY" "$TEAL" "$GREEN" "$YELLOW" "$PEACH" "$MAROON" "$RED" "$MAUVE" "$PINK" "$FLAMINGO" "$ROSEWATER")

function getRandomCatColor() {
  echo "${RANDOM_CAT_COLOR[$RANDOM % ${#RANDOM_CAT_COLOR[@]}]}"
}

#
# LEGACY COLORS
#
# Color Palette
export GREY=0xff7C8494        # From building surfaces (#7C8494)
export TRANSPARENT=0x00000000 # Transparent color (#00000000)
export BLACK=0xff1A1E23       # Dark gray from shadows (#1A1E23)
export WHITE=0xffffffff      # Light beige from windows/reflections (#DCD7C9)
