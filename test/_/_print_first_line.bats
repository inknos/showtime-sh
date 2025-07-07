#!/usr/bin/env bats

setup() {
    load ../import_showtime.bash
}

@test "S_BULLET is set" {
    [[ -n "$S_BULLET" ]]
}

@test "_print_first_line" {
    run _print_first_line 'test message'
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = "${C_BULLET@E}${S_BULLET}${NC@E} ${C_TEXT@E}test message${NC@E}" ]]
}

@test "_print_first_line with custom symbol" {
    S_BULLET=">" run _print_first_line 'test message'
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = "${C_BULLET@E}>${NC@E} ${C_TEXT@E}test message${NC@E}" ]]
}

@test "DRYRUN=true _print_first_line" {
    DRYRUN=true run _print_first_line 'test message'
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = "${C_BULLET@E}${S_BULLET}${NC@E} ${C_TEXT@E}test message${NC@E}" ]]
}

@test "DRYRUN=true _print_first_line with custom symbol" {
    DRYRUN=true S_BULLET=">" run _print_first_line 'test message'
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = "${C_BULLET@E}>${NC@E} ${C_TEXT@E}test message${NC@E}" ]]
}

@test "EXPORT=true _print_first_line" {
    EXPORT=true run _print_first_line 'test message'
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = "# test message" ]]
}

@test "EXPORT=true _print_first_line with custom symbol does not change the symbol" {
    EXPORT=true S_BULLET=">" run _print_first_line 'test message'
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = "# test message" ]]
}

@test "QUIET=true _print_first_line" {
    QUIET=true run _print_first_line 'test message'
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = "" ]]
} 