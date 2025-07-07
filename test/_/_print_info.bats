#!/usr/bin/env bats

setup() {
    load ../import_showtime.bash
}

@test "_print_info" {
    run _print_info 'test info'
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = "${C_INFO@E}${S_INFO} test info${NC@E}" ]]
}

@test "DRY_RUN=true _print_info" {
    DRY_RUN=true run _print_info 'test info'
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = "${C_INFO@E}${S_INFO} test info${NC@E}" ]]
}

@test "EXPORT=true _print_info" {
    EXPORT=true run _print_info 'test info'
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = "# INF: test info" ]]
}

@test "QUIET=true _print_info" {
    QUIET=true run _print_info 'test info'
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = "" ]]
} 