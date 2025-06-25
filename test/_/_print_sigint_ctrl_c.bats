#!/usr/bin/env bats

setup() {
    if [ $(basename $(pwd)) = "_" ]; then
        source ../../showtime.sh
    else
        source showtime.sh
    fi
}

@test "_print_sigint_ctrl_c" {
    run _print_sigint_ctrl_c
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = *"Ctrl+C detected"* ]]
}

@test "DRY_RUN=true _print_sigint_ctrl_c" {
    DRY_RUN=true run _print_sigint_ctrl_c
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = *"Ctrl+C detected"* ]]
}

@test "EXPORT=true _print_sigint_ctrl_c" {
    EXPORT=true run _print_sigint_ctrl_c
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = "" ]]
}

@test "QUIET=true _print_sigint_ctrl_c" {
    QUIET=true run _print_sigint_ctrl_c
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = "" ]]
} 