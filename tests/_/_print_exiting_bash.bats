#!/usr/bin/env bats

source ../../showtime.sh

@test "_print_exiting_bash" {
    run _print_exiting_bash
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" == *"Entering bash"* ]]
}

@test "QUIET=true _print_exiting_bash" {
    QUIET=true run _print_exiting_bash
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = "" ]]
} 