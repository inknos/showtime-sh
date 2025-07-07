#!/usr/bin/env bats

setup() {
    load ../import_showtime.bash
}

@test "_print_exiting_bash" {
    run _print_exiting_bash
    _=$(( status == 0 ))
    [[ "${lines[0]}" = "${C_INTERACTIVE@E}Exiting bash...${NC@E}" ]]
}

@test "DRYRUN=true _print_exiting_bash" {
    DRYRUN=true run _print_exiting_bash
    _=$(( status == 0 ))
    [[ "${lines[0]}" = "${C_INTERACTIVE@E}Exiting bash...${NC@E}" ]]
}

@test "EXPORT=true _print_exiting_bash" {
    EXPORT=true run _print_exiting_bash
    _=$(( status == 0 ))
    [[ "${lines[0]}" = "" ]]
}

@test "QUIET=true _print_exiting_bash" {
    QUIET=true run _print_exiting_bash
    _=$(( status == 0 ))
    [[ "${lines[0]}" = "" ]]
}
