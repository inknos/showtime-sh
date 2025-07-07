#!/usr/bin/env bats

setup() {
    load ../import_showtime.bash
}

@test "_print_press_enter_to_continue" {
    run _print_press_enter_to_continue
    (( status == 0 ))
    [[ "${lines[0]}" == "${C_PROMPT@E}Press Enter to continue...${NC@E}" ]]
}

@test "DRY_RUN=true _print_press_enter_to_continue" {
    DRY_RUN=true run _print_press_enter_to_continue
    (( status == 0 ))
    [[ "${lines[0]}" == "${C_PROMPT@E}Press Enter to continue...${NC@E}" ]]
}

@test "EXPORT=true _print_press_enter_to_continue" {
    EXPORT=true run _print_press_enter_to_continue
    (( status == 0 ))
    [[ "${lines[0]}" = "" ]]
}

@test "QUIET=true _print_press_enter_to_continue" {
    QUIET=true run _print_press_enter_to_continue
    (( status == 0 ))
    [[ "${lines[0]}" = "" ]]
} 