#!/usr/bin/env bats

source ../../showtime.sh

@test "_print_debug" {
    run _print_debug 'debug message'
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = "" ]]
}

@test "DEBUG=true _print_debug" {
    DEBUG=true run _print_debug 'debug message'
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" == *"debug message"* ]]
    [[ "${lines[0]}" == *"$"* ]]
} 