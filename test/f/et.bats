#!/usr/bin/env bats

setup() {
    load ../import_showtime.bash
}

teardown() {
    rm -f test.txt
}

@test "et \"sleep 100\" .1" {
    run et "sleep 100" .1
    [[ $status == 0 ]]
    [[ "${lines[0]}" = "${C_COMMAND@E}${S_COMMAND}${NC@E} ${C_COMMAND_TEXT@E}sleep 100${NC@E}" ]]
    [[ "${lines[1]}" = "${C_WARNING@E}${S_WARNING} Command timed out after .1 seconds${NC@E}" ]]
    [[ ${#lines[@]} == 2 ]]
}

@test "QUIET=true et \"sleep 100\" .1" {
    QUIET=true run et "sleep 100" .1
    [[ $status == 0 ]]
    [[ ${#lines[@]} == 0 ]]
}

@test "DRYRUN=true et \"sleep 100\" .1" {
    DRYRUN=true run et "sleep 100" .1
    [[ $status == 0 ]]
    [[ "${lines[0]}" = "${C_COMMAND@E}${S_COMMAND}${NC@E} ${C_COMMAND_TEXT@E}sleep 100${NC@E}" ]]
    [[ ${#lines[@]} == 1 ]]
}

@test "EXPORT_FORMAT=sh et \"sleep 100\" .1" {
    EXPORT_FORMAT="sh" run et "sleep 100" .1
    [[ $status == 0 ]]
    [[ "${lines[0]}" = "${C_COMMAND@E}${S_COMMAND}${NC@E} ${C_COMMAND_TEXT@E}sleep 100${NC@E}" ]]
    [[ ${#lines[@]} == 1 ]]
}
