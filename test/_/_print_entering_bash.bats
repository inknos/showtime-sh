#!/usr/bin/env bats

setup() {
    load ../import_showtime.bash
}

@test "_print_entering_bash" {
    run _print_entering_bash
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = "${C_INTERACTIVE@E}Entering bash...${NC@E}" ]]
}

@test "DRYRUN=true _print_entering_bash" {
    DRYRUN=true run _print_entering_bash
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = "${C_INTERACTIVE@E}Entering bash...${NC@E}" ]]
}

@test "EXPORT=true _print_entering_bash" {
    EXPORT=true run _print_entering_bash
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = "" ]]
}

@test "QUIET=true _print_entering_bash" {
    QUIET=true run _print_entering_bash
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = "" ]]
}