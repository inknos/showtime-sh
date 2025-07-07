#!/usr/bin/env bats

setup() {
    load ../import_showtime.bash
}

@test "ps \"test\"" {
    run ps 'test'
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = "${C_SUCCESS@E}${S_SUCCESS} test${NC@E}" ]]
}

@test "DRYRUN=true ps \"test\"" {
    DRYRUN=true run ps 'test'
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = "${C_SUCCESS@E}${S_SUCCESS} test${NC@E}" ]]
}

@test "EXPORT=true ps \"test\"" {
    EXPORT=true run ps 'test'
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = "# test" ]]
}

@test "QUIET=true ps \"test\"" {
    QUIET=true run ps 'test'
    [[ "$status" -eq 0 ]]
    [[ "${#lines[@]}" -eq 0 ]]
}

