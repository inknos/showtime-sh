#!/usr/bin/env bats

setup() {
    load ../import_showtime.bash
}

@test "_print_separator" {
    run _print_separator
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" == *"----"* ]]
}

@test "DRY_RUN=true _print_separator" {
    DRY_RUN=true run _print_separator
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" == *"----"* ]]
}

@test "EXPORT=true _print_separator" {
    EXPORT=true run _print_separator
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = "# ----------------------------------------" ]]
}

@test "QUIET=true _print_separator" {
    QUIET=true run _print_separator
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = "" ]]
} 