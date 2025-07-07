#!/usr/bin/env bats

setup() {
    load ../import_showtime.bash
}

@test "pe \"test\"" {
    run pe 'test'
    (( status == 0 ))
    [[ "${lines[0]}" = "${C_ERROR@E}${S_ERROR} test${NC@E}" ]]
}

@test "DRYRUN=true pe \"test\"" {
    DRYRUN=true run pe 'test'
    (( status == 0 ))
    [[ "${lines[0]}" = "${C_ERROR@E}${S_ERROR} test${NC@E}" ]]
}

@test "EXPORT=true pe \"test\"" {
    EXPORT=true run pe 'test'
    (( status == 0 ))
    [[ "${lines[0]}" = "# ERR: test" ]]
}

@test "QUIET=true pe \"test\"" {
    QUIET=true run pe 'test'
    (( status == 0 ))
    (( ${#lines[@]} == 0 ))
}
