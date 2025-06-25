#!/usr/bin/env bats

setup() {
    if [ $(basename $(pwd)) = "run"]; then
        source ../../showtime.sh
    else
        source showtime.sh
    fi
}

# run tests go here