#!/usr/bin/env bats

source ../../showtime.sh

@test "_print_success" {
    run _print_success 'test success'
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" == *"test success"* ]]
    [[ "${lines[0]}" == *"✓"* ]]
}

@test "QUIET=true _print_success" {
    QUIET=true run _print_success 'test success'
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = "" ]]
} 