#!/usr/bin/env bats

setup() {
    load ../import_showtime.bash
}

@test "pe \"test\"" {
    run pe 'test'
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = *"${S_ERROR}"*"ERR: test"* ]]
}

@test "DRYRUN=true pe \"test\"" {
    DRYRUN=true run pe 'test'
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = *"${S_ERROR}"*"ERR: test"* ]]
}

@test "EXPORT=true pe \"test\"" {
    EXPORT=true run pe 'test'
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = "# ERR: test" ]]
}

@test "QUIET=true pe \"test\"" {
    QUIET=true run pe 'test'
    [[ "$status" -eq 0 ]]
    [[ "${#lines[@]}" -eq 0 ]]
}
