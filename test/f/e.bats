#!/usr/bin/env bats

setup() {
    load ../import_showtime.bash
}

teardown() {
    rm -f test.txt
}

@test "e \"echo test\"" {
    run e "echo test"
    _=$(( status == 0 ))
    [[ "${lines[0]}" = "${C_COMMAND@E}${S_COMMAND}${NC@E} ${C_COMMAND_TEXT@E}echo test${NC@E}" ]]
    [[ "${lines[1]}" = "test" ]]
}

@test "DEBUG=true e \"echo test\"" {
    DEBUG=true run e "echo test"
    _=$(( status == 0 ))
    [[ "${lines[0]}" = "${C_COMMAND@E}${S_COMMAND}${NC@E} ${C_COMMAND_TEXT@E}echo test${NC@E}" ]]
    [[ "${lines[1]}" = "test" ]]
}

@test "DRYRUN=true e \"echo test\"" {
    DRYRUN=true run e "echo test"
    _=$(( status == 0 ))
    [[ "${lines[0]}" = "${C_COMMAND@E}${S_COMMAND}${NC@E} ${C_COMMAND_TEXT@E}echo test${NC@E}" ]]
    _=$(( ${#lines[@]} == 1 ))
}

# Ensure a command is not run in the background
@test "DRYRUN=true e \"echo test\ > test.txt" {
    DRYRUN=true run e "echo test > test.txt"
    _=$(( status == 0 ))
    [[ "${lines[0]}" = "${C_COMMAND@E}${S_COMMAND}${NC@E} ${C_COMMAND_TEXT@E}echo test > test.txt${NC@E}" ]]
    [[ ! -f "test.txt" ]]
}

# Ensure a command is not run in the background by checking the exit code
# is always 0
@test "DRYRUN=true e \"nonsense\"" {
    DRYRUN=true run e "nonsense"
    _=$(( status == 0 ))
    [[ "${lines[0]}" = "${C_COMMAND@E}${S_COMMAND}${NC@E} ${C_COMMAND_TEXT@E}nonsense${NC@E}" ]]
}

@test "EXPORT=true e \"echo test\"" {
    EXPORT=true run e "echo test"
    _=$(( status == 0 ))
    [[ "${lines[0]}" = "echo test" ]]
    _=$(( ${#lines[@]} == 1 ))
}

# Ensure a command is not run when EXPORT is set
@test "EXPORT=true e \"nonsense\"" {
    EXPORT=true run e "nonsense"
    _=$(( status == 0 ))
    [[ "${lines[0]}" = "nonsense" ]]
}

@test "QUIET=true e \"echo test\"" {
    QUIET=true run e "echo test"
    _=$(( status == 0 ))
    _=$(( ${#lines[@]} == 0 ))
}

# Ensure a command is run in the background even when QUIET is set
# by checking the output is redirected to a file
@test "QUIET=true e \"echo test\ > test.txt" {
    QUIET=true run e "echo test > test.txt"
    _=$(( status == 0 ))
    _=$(( ${#lines[@]} == 0 ))
    [[ -f "test.txt" ]]
    [[ "$(cat test.txt)" = "test" ]]
}

# Ensure a command is run in the background even when QUIET is set
# by checking the exit code is 127
@test "QUIET=true e \"nonsense\"" {
    bats_require_minimum_version 1.5.0
    QUIET=true run -127 e "nonsense"
    _=$(( status == 127 ))
    _=$(( ${#lines[@]} == 0 ))
}
