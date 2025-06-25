#!/usr/bin/env bats

setup() {
    load ../import_showtime.bash
}

@test "_print_press_enter_to_continue" {
    run _print_press_enter_to_continue
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" == *"Press Enter to continue"* ]]
}

@test "DRY_RUN=true _print_press_enter_to_continue" {
    DRY_RUN=true run _print_press_enter_to_continue
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" == *"Press Enter to continue"* ]]
}

@test "EXPORT=true _print_press_enter_to_continue" {
    EXPORT=true run _print_press_enter_to_continue
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = "" ]]
}

@test "QUIET=true _print_press_enter_to_continue" {
    QUIET=true run _print_press_enter_to_continue
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = "" ]]
} 