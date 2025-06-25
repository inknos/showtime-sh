#!/usr/bin/env bats

source ../../showtime.sh

@test "_print_info" {
    run _print_info 'test info'
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" == *"INF: test info"* ]]
    [[ "${lines[0]}" == *"ℹ"* ]]
}

@test "QUIET=true _print_info" {
    QUIET=true run _print_info 'test info'
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = "" ]]
} 