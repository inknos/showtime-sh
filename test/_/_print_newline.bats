#!/usr/bin/env bats

setup() {
    load ../import_showtime.bash
}

@test "_print_newline" {
    run _print_newline
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = "" ]]
}

@test "DRY_RUN=true _print_newline" {
    DRY_RUN=true run _print_newline
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = "" ]]
}

@test "EXPORT=true _print_newline" {
    EXPORT=true run _print_newline
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = "" ]]
}

@test "QUIET=true _print_newline" {
    QUIET=true run _print_newline
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = "" ]]
} 