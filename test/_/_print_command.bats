#!/usr/bin/env bats

setup() {
    load ../import_showtime.bash
}

@test "test _print_command()" {
    run _print_command 'echo test'
    _=$(( status == 0 ))
    [[ "${lines[0]}" = "${C_COMMAND@E}${S_COMMAND}${NC@E} ${C_COMMAND_TEXT@E}echo test${NC@E}" ]]
}

@test "test _print_command() with QUIET=true" {
    QUIET=true run _print_command 'echo test'
    _=$(( status == 0 ))
    [[ "${lines[0]}" = "" ]]
}

@test "test _print_command() with DRYRUN=true" {
    DRYRUN=true run _print_command 'echo test'
    _=$(( status == 0 ))
    [[ "${lines[0]}" = "${C_COMMAND@E}${S_COMMAND}${NC@E} ${C_COMMAND_TEXT@E}echo test${NC@E}" ]]
}

@test "test _print_command() with EXPORT=true" {
    EXPORT=true run _print_command 'echo test'
    _=$(( status == 0 ))
    [[ "${lines[0]}" = "echo test" ]]
}
