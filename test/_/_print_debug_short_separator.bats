#!/usr/bin/env bats

setup() {
    if [ $(basename $(pwd)) = "_" ]; then
        source ../../showtime.sh
    else
        source showtime.sh
    fi
}

@test "_print_debug_short_separator" {
    run _print_debug_short_separator
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = "" ]]
}

@test "DEBUG=true _print_debug_short_separator" {
    DEBUG=true run _print_debug_short_separator
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" == *"---"* ]]
} 