#!/usr/bin/env bats

source ../../showtime.sh

@test "_print_sigint_ctrl_c" {
    run _print_sigint_ctrl_c
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" == *"Ctrl+C detected"* ]]
}

@test "QUIET=true _print_sigint_ctrl_c" {
    QUIET=true run _print_sigint_ctrl_c
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = "" ]]
} 