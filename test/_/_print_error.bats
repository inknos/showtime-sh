#!/usr/bin/env bats

setup() {
    load ../import_showtime.bash
}

@test "_print_error" {
    run _print_error 'test error'
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" == "${C_ERROR@E}${S_ERROR} test error${NC@E}" ]]
}

@test "DRYRUN=true _print_error" {
    DRYRUN=true run _print_error 'test error'
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = "${C_ERROR@E}${S_ERROR} test error${NC@E}" ]]
}

@test "EXPORT=true _print_error" {
    EXPORT=true run _print_error 'test error'
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = "# ERR: test error" ]]
}

@test "QUIET=true _print_error" {
    QUIET=true run _print_error 'test error'
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = "" ]]
} 