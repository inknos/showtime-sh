#!/bin/bash

# Shared color definitions and utility functions for demo scripts
# Source this file in other scripts with: source "$(dirname "$0")/colors.sh"

# Color definitions
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

# Global history file for demo commands
DEMO_HISTFILE=$(mktemp)

# Signal handling for Ctrl+C
handle_sigint() {
    echo -e "\n${PURPLE}Ctrl+C detected - press Ctrl+C again within 2 seconds to exit demo${NC}"

    # Temporarily change trap to exit on second Ctrl+C
    trap 'echo -e "\n${RED}Double Ctrl+C - exiting demo${NC}"; exit 130' SIGINT

    # Wait 2 seconds for second Ctrl+C, then enter interactive mode
    sleep 2
    trap 'handle_sigint' SIGINT
    echo -e "${PURPLE}Entering bash...${NC}\n"
    b
    echo -e "${DIM}${CYAN}Press Enter to continue...${NC}"
}

# Set up the trap
trap 'handle_sigint' SIGINT

# Function to print colored headers
h() {
    if [ "$EXPORT" != true ]; then
        clear
    fi
    hh "$1"
}

hh() {
    if [ "$EXPORT" = true ]; then
        echo -e "# ========================================"
        echo -e "#  $1"
        echo -e "# ========================================\n"
    else
        echo -e "${CYAN}========================================${NC}"
        echo -e "${WHITE}${BOLD}$1${NC}"
        echo -e "${CYAN}========================================${NC}\n"
    fi
}

# Function to print step messages
p() {
    local first_line=true
    echo "$1" | fold -s -w 78 | while IFS= read -r line; do
        if [ "$first_line" = true ]; then
            if [ "$EXPORT" = true ]; then
                echo -e "# $line"
            else
                echo -e "${GREEN}➤${NC} ${YELLOW}$line${NC}"
            fi
            first_line=false
        else
            if [ "$EXPORT" = true ]; then
                echo -e "# $line"
            else
                echo -e "  ${YELLOW}$line${NC}"
            fi
        fi
    done
    if [ "$EXPORT" != true ]; then
        echo
    fi
}

# Function to print success messages
ps() {
    if [ "$EXPORT" = true ]; then
        echo -e "# $1"
    else
        echo -e "\n${GREEN}✓${NC} ${WHITE}${BOLD}$1${NC}\n"
    fi
}

# Function to print error messages
pe() {
    if [ "$EXPORT" = true ]; then
        echo -e "# $1"
    else
        echo -e "\n${RED}✗${NC} ${WHITE}${BOLD}Error: $1${NC}\n"
    fi
}

# Function to print warning messages
pw() {
    if [ "$EXPORT" = true ]; then
        echo -e "# $1"
    else
        echo -e "\n${YELLOW}⚠${NC} ${WHITE}${BOLD}Warning: $1${NC}\n"
    fi
}

# Function to print info messages
pi() {
    if [ "$EXPORT" = true ]; then
        echo -e "# $1"
    else
        echo -e "${BLUE}ℹ${NC} ${WHITE}$1${NC}"
    fi
}

# Function to print section separators
p-() {
    if [ "$EXPORT" = true ]; then
        echo -e "# ----------------------------------------"
    else
        echo -e "${DIM}${CYAN}----------------------------------------${NC}"
    fi
}

# Function to print command in red and execute it
# put a newline at the end
e() {
    if [ "$EXPORT" = true ]; then
        echo -e "$1"
        return
    fi
    echo -e "${RED}$ ${WHITE}$1${NC}"

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
    if [ "$EXPORT" = true ]; then
        echo -e "$1"
        return
    fi
    local timeout_duration="${2:-30}"  # Default 30 seconds
    echo -e "${RED}$ ${WHITE}$1${NC}"
    timeout "$timeout_duration" bash -c "$1"
    local exit_code=$?
    if [ $exit_code -eq 124 ]; then
        pw "Command timed out after ${timeout_duration} seconds"
    fi
    return $exit_code
}

# Function to pause demo execution based on GOON variable
w() {
    if [ "$EXPORT" = true ]; then
        return
    fi
    if [ "${GOON:-false}" = "true" ]; then
        # If GOON is true, continue without pausing
        return
    else
        # If GOON is false or not set, wait for user input
        echo -e "${DIM}${CYAN}Press Enter to continue...${NC}"
        read -r
    fi
}

b() {
    if [ "$EXPORT" = true ]; then
        return
    fi
    if [ -z "$DEMO_NAME" ]; then
        DEMO=demo
    else
        DEMO=$DEMO_NAME
    fi
    HISTFILE="$DEMO_HISTFILE" PS1="\[\033[0;35m\]($DEMO) \$ \[\033[0m\]" bash --rcfile <(
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
    echo -e "${PURPLE}Exiting bash...${NC}\n"
}
