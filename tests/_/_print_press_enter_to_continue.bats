#!/usr/bin/env bats

source ../../showtime.sh

@test "_print_press_enter_to_continue" {
    run _print_press_enter_to_continue
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" == *"Press Enter to continue"* ]]
}

@test "QUIET=true _print_press_enter_to_continue" {
    QUIET=true run _print_press_enter_to_continue
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = "" ]]
} 