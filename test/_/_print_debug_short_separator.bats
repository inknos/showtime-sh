#!/usr/bin/env bats

setup() {
    load ../import_showtime.bash
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