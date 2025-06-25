#!/usr/bin/env bats

setup() {
    load ../import_showtime.bash
}

@test "pw \"test\"" {
    run pw 'test'
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = *"${S_WARNING}"*"WRN: test"* ]]
}

@test "DRYRUN=true pw \"test\"" {
    DRYRUN=true run pw 'test'
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = *"${S_WARNING}"*"WRN: test"* ]]
}

@test "EXPORT=true pw \"test\"" {
    EXPORT=true run pw 'test'
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = "# WRN: test" ]]
}

@test "QUIET=true pw \"test\"" {
    QUIET=true run pw 'test'
    [ "$status" -eq 0 ]
    [[ "${#lines[@]}" -eq 0 ]]
}
