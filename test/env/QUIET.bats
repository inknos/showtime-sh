#!/usr/bin/env bats

setup() {
    if [ $(basename $(pwd)) = "env"]; then
        source ../../showtime.sh
    else
        source showtime.sh
    fi
}