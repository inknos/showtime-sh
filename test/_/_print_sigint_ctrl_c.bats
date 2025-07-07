#!/usr/bin/env bats

setup() {
    load ../import_showtime.bash
}

@test "_print_sigint_ctrl_c" {
    run _print_sigint_ctrl_c
    (( status == 0 ))
    [[ "${lines[0]}" = "${C_INTERACTIVE@E}Ctrl+C detected - press Ctrl+C again within 2 seconds to exit demo${NC@E}" ]]
}

@test "DRY_RUN=true _print_sigint_ctrl_c" {
    DRY_RUN=true run _print_sigint_ctrl_c
    (( status == 0 ))
    [[ "${lines[0]}" = "${C_INTERACTIVE@E}Ctrl+C detected - press Ctrl+C again within 2 seconds to exit demo${NC@E}" ]]
}

@test "EXPORT=true _print_sigint_ctrl_c" {
    EXPORT=true run _print_sigint_ctrl_c
    (( status == 0 ))
    [[ "${lines[0]}" = "" ]]
}

@test "QUIET=true _print_sigint_ctrl_c" {
    QUIET=true run _print_sigint_ctrl_c
    (( status == 0 ))
    [[ "${lines[0]}" = "" ]]
} 