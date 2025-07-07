#!/bin/bash
# Custom theme for minimal demo example
# This file is automatically loaded by showtime.sh

# Base colors for reference
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
BOLD='\033[1m'
DIM='\033[2m'

# Custom theme: "Ocean Blue"
export C_HEADER="$BLUE"                     # Blue headers instead of cyan
export C_HEADER_TEXT="$WHITE$BOLD"         # Bright white text
export C_SUCCESS="$GREEN"                  # Keep green for success
export C_ERROR="$RED"                      # Keep red for errors
export C_WARNING="$YELLOW"                 # Keep yellow for warnings
export C_INFO="$CYAN"                      # Cyan for info instead of blue
export C_COMMAND="$PURPLE"                 # Purple command prompt instead of red
export C_COMMAND_TEXT="$WHITE"             # White command text
export C_TEXT="$CYAN"                      # Cyan text instead of yellow
export C_BULLET="$BLUE"                    # Blue bullets to match headers
export C_INTERACTIVE="$PURPLE"             # Purple for interactive elements
export C_PROMPT="$DIM$BLUE"               # Dim blue for prompts
export C_SEPARATOR="$DIM$BLUE"            # Dim blue separators

# Custom bullet symbol
export S_BULLET="▶"                        # Arrow instead of ➤
