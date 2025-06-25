#!/usr/bin/env bats

source ../../showtime.sh

@test "_print_first_line" {
    run _print_first_line 'test message'
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" == *"test message"* ]]
}

@test "QUIET=true _print_first_line" {
    QUIET=true run _print_first_line 'test message'
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = "" ]]
} 