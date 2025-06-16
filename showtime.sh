#!/bin/bash

# Shared color definitions and utility functions for demo scripts
# Source this file in other scripts with: source "$(dirname "$0")/colors.sh"

# Base color definitions
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
BOLD='\033[1m'
DIM='\033[2m'
NC='\033[0m' # No Color

# Load theme.sh from demo directory if it exists
if [ -f "$(dirname "$0")/theme.sh" ]; then
    source "$(dirname "$0")/theme.sh" 2>/dev/null || true
fi

# Semantic color definitions (configurable)
C_HEADER=${C_HEADER:-$CYAN}
C_HEADER_TEXT=${C_HEADER_TEXT:-$WHITE$BOLD}
C_SUCCESS=${C_SUCCESS:-$GREEN}
C_ERROR=${C_ERROR:-$RED}
C_WARNING=${C_WARNING:-$YELLOW}
C_INFO=${C_INFO:-$BLUE}
C_COMMAND=${C_COMMAND:-$RED}
C_COMMAND_TEXT=${C_COMMAND_TEXT:-$WHITE}
C_TEXT=${C_TEXT:-$YELLOW}
C_BULLET=${C_BULLET:-$GREEN}
C_PROMPT=${C_PROMPT:-$DIM$CYAN}
C_INTERACTIVE=${C_INTERACTIVE:-$PURPLE}
C_SEPARATOR=${C_SEPARATOR:-$DIM$CYAN}

# Configurable symbols
S_BULLET=${S_BULLET:-"➤"}

# Global history file for demo commands
DEMO_HISTFILE=$(mktemp)

# Signal handling for Ctrl+C
handle_sigint() {
    echo -e "\n${C_INTERACTIVE}Ctrl+C detected - press Ctrl+C again within 2 seconds to exit demo${NC}"

    # Temporarily change trap to exit on second Ctrl+C
    trap 'echo -e "\n${C_ERROR}Double Ctrl+C - exiting demo${NC}"; exit 130' SIGINT

    # Wait 2 seconds for second Ctrl+C, then enter interactive mode
    sleep 2
    trap 'handle_sigint' SIGINT
    echo -e "${C_INTERACTIVE}Entering bash...${NC}\n"
    b
    echo -e "${DIM}${CYAN}Press Enter to continue...${NC}"
}

# Set up the trap
trap 'handle_sigint' SIGINT

# Function to print colored headers
h() {
    clear
    hh "$1"
}

hh() {
    echo -e "${C_HEADER}========================================${NC}"
    echo -e "${C_HEADER_TEXT}$1${NC}"
    echo -e "${C_HEADER}========================================${NC}\n"
}

# Function to print step messages
p() {
    local first_line=true
    echo "$1" | fold -s -w 78 | while IFS= read -r line; do
        if [ "$first_line" = true ]; then
            echo -e "${C_BULLET}${S_BULLET}${NC} ${C_TEXT}$line${NC}"
            first_line=false
        else
            echo -e "  ${C_TEXT}$line${NC}"
        fi
    done
    echo
}

# Function to print success messages
ps() {
    echo -e "\n${C_SUCCESS}✓${NC} ${C_HEADER_TEXT}$1${NC}\n"
}

# Function to print error messages
pe() {
    echo -e "\n${C_ERROR}✗${NC} ${C_HEADER_TEXT}Error: $1${NC}\n"
}

# Function to print warning messages
pw() {
    echo -e "\n${C_WARNING}⚠${NC} ${C_HEADER_TEXT}Warning: $1${NC}\n"
}

# Function to print info messages
pi() {
    echo -e "${C_INFO}ℹ${NC} ${C_COMMAND_TEXT}$1${NC}"
}

# Function to print section separators
p-() {
    echo -e "${C_SEPARATOR}----------------------------------------${NC}"
}

# Function to print command in red and execute it
# put a newline at the end
e() {
    echo -e "${C_COMMAND}$ ${C_COMMAND_TEXT}$1${NC}"

    # Append command to global history file
    echo "$1" >> "$DEMO_HISTFILE"

    # Execute with HISTFILE set
    HISTFILE="$DEMO_HISTFILE" bash -c "$1"
    local exit_code=$?
    echo
    return $exit_code
}

# Function to print command in red and execute it with timeout
et() {
    local timeout_duration="${2:-30}"  # Default 30 seconds
    echo -e "${C_COMMAND}$ ${C_COMMAND_TEXT}$1${NC}"
    timeout "$timeout_duration" bash -c "$1"
    local exit_code=$?
    if [ $exit_code -eq 124 ]; then
        pw "Command timed out after ${timeout_duration} seconds"
    fi
    return $exit_code
}

# Function to pause demo execution based on GOON variable
w() {
    if [ "${GOON:-false}" = "true" ]; then
        # If GOON is true, continue without pausing
        return
    else
        # If GOON is false or not set, wait for user input
        echo -e "${C_PROMPT}Press Enter to continue...${NC}"
        read -r
    fi
}

b() {
    if [ -z "$DEMO_NAME" ]; then
        DEMO=demo
    else
        DEMO=$DEMO_NAME
    fi
    HISTFILE="$DEMO_HISTFILE" PS1="\[${C_INTERACTIVE}\]($DEMO) \$ \[${NC}\]" bash --rcfile <(
        echo "set +h"
        echo "history -r '$DEMO_HISTFILE'"
        echo "trap 'history -w \"$DEMO_HISTFILE\"' EXIT"
        echo "# Load bash completion"
        echo "if [ -f /etc/bash_completion ]; then"
        echo "    . /etc/bash_completion"
        echo "elif [ -f /usr/share/bash-completion/bash_completion ]; then"
        echo "    . /usr/share/bash-completion/bash_completion"
        echo "fi"
    )
    echo -e "${C_INTERACTIVE}Exiting bash...${NC}\n"
}

# Export mode function overrides
if [ "$EXPORT" = true ]; then
    # Export versions of functions - convert output to comments or commands
    _export_comment() {
        echo "$1" | fold -s -w 78 | sed 's/^/# /'
    }

    _export_header() {
        echo "# ========================================"
        echo "#  $1"
        echo "# ========================================"
        echo
    }

    _export_noop() {
        :  # do nothing
    }

    # Override functions for export mode
    h() { _export_header "$1"; }
    hh() { _export_header "$1"; }
    p() { _export_comment "$1"; }
    ps() { _export_comment "$1"; }
    pe() { _export_comment "Error: $1"; }
    pw() { _export_comment "Warning: $1"; }
    pi() { _export_comment "$1"; }
    p-() { echo "# ----------------------------------------"; }
    e() { echo "$1"; }
    et() { echo "$1"; }  # ignore timeout parameter in export mode
    w() { _export_noop; }
    b() { _export_noop; }
fi
