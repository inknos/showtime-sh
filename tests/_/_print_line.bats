#!/usr/bin/env bats

source ../../showtime.sh

@test "_print_line" {
    run _print_line 'test message'
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" == *"test message"* ]]
}

@test "QUIET=true _print_line" {
    QUIET=true run _print_line 'test message'
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = "" ]]
} 