#!/usr/bin/env bats

setup() {
    if [ $(basename $(pwd)) = "f" ]; then
        source ../../showtime.sh
    else
        source showtime.sh
    fi
}


# Some thinking is required to test this