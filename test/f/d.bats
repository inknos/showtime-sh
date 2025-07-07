#!/usr/bin/env bats

setup() {
    load ../import_showtime.bash
}

@test "d \"test\"" {
    run d "test"
    [[ "$status" -eq 0 ]]
    [[ "${#lines[@]}" -eq 0 ]]
}

@test "DEBUG=true d \"test\"" {
    DEBUG=true run d "test"
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = "${C_DEBUG@E}${S_DEBUG}${NC@E} ${C_DEBUG_TEXT@E}test${NC@E}" ]]
}

@test "DEBUG=true DRYRUN=true d \"test\"" {
    DEBUG=true DRYRUN=true run d "test"
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = "${C_DEBUG@E}${S_DEBUG}${NC@E} ${C_DEBUG_TEXT@E}test${NC@E}" ]]
}

@test "DEBUG=true QUIET=true d \"test\"" {
    DEBUG=true QUIET=true run d "test"
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = "${C_DEBUG@E}${S_DEBUG}${NC@E} ${C_DEBUG_TEXT@E}test${NC@E}" ]]
}

@test "DEBUG=true EXPORT=true S_DEBUG=\"!\" d \"test\"" {
    DEBUG=true EXPORT=true S_DEBUG="!" run d "test"
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = "${C_DEBUG@E}!${NC@E} ${C_DEBUG_TEXT@E}test${NC@E}" ]]
}
