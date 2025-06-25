#!/usr/bin/env bats

source ../../showtime.sh

@test "_print_newline" {
    run _print_newline
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = "" ]]
}

@test "QUIET=true _print_newline" {
    QUIET=true run _print_newline
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = "" ]]
} 