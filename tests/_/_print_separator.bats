#!/usr/bin/env bats

source ../../showtime.sh

@test "_print_separator" {
    run _print_separator
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" == *"----"* ]]
}

@test "QUIET=true _print_separator" {
    QUIET=true run _print_separator
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = "" ]]
} 