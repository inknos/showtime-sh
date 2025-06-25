#!/usr/bin/env bats

source ../../showtime.sh

@test "_print_error" {
    run _print_error 'test error'
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" == *"ERR: test error"* ]]
    [[ "${lines[0]}" == *"✗"* ]]
}

@test "QUIET=true _print_error" {
    QUIET=true run _print_error 'test error'
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = "" ]]
} 