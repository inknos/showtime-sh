#!/usr/bin/env bats

setup() {
    load ../import_showtime.bash
}

@test "d \"test\"" {
    run d "test"
    [ "$status" -eq 0 ]
    [[ "${#lines[@]}" -eq 0 ]]
}

@test "DEBUG=true d \"test\"" {
    DEBUG=true run d "test"
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = *"${S_DEBUG}"*"test"* ]]
}

@test "DEBUG=true DRYRUN=true d \"test\"" {
    DEBUG=true DRYRUN=true run d "test"
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = *"${S_DEBUG}"*"test"* ]]
}

@test "DEBUG=true QUIET=true d \"test\"" {
    DEBUG=true QUIET=true run d "test"
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = *"${S_DEBUG}"*"test"* ]]
}

@test "DEBUG=true EXPORT=true S_DEBUG=\"!\" d \"test\"" {
    DEBUG=true EXPORT=true S_DEBUG="!" run d "test"
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = *"!"*"test"* ]]
}
