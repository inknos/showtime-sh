#!/usr/bin/env bats

setup() {
    load ../import_showtime.bash
}

@test "pw \"test\"" {
    run pw 'test'
    _=$(( status == 0 ))
    [[ "${lines[0]}" = "${C_WARNING@E}${S_WARNING} test${NC@E}" ]]
}

@test "DRYRUN=true pw \"test\"" {
    DRYRUN=true run pw 'test'
    _=$(( status == 0 ))
    [[ "${lines[0]}" = "${C_WARNING@E}${S_WARNING} test${NC@E}" ]]
}

@test "EXPORT=true pw \"test\"" {
    EXPORT=true run pw 'test'
    _=$(( status == 0 ))
    [[ "${lines[0]}" = "# WRN: test" ]]
}

@test "QUIET=true pw \"test\"" {
    QUIET=true run pw 'test'
    _=$(( status == 0 ))
    _=$(( ${#lines[@]} == 0 ))
}
