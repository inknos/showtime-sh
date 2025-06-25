#!/usr/bin/env bats

setup() {
    if [ $(basename $(pwd)) = "f"]; then
        source ../../showtime.sh
    else
        source showtime.sh
    fi
}

@test "ps \"test\"" {
    run ps 'test'
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = *"${S_SUCCESS}"*"test"* ]]
}

@test "DRYRUN=true ps \"test\"" {
    DRYRUN=true run ps 'test'
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = *"${S_SUCCESS}"*"test"* ]]
}

@test "EXPORT=true ps \"test\"" {
    EXPORT=true run ps 'test'
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = "# test" ]]
}

@test "QUIET=true ps \"test\"" {
    QUIET=true run ps 'test'
    [ "$status" -eq 0 ]
    [[ "${#lines[@]}" -eq 0 ]]
}

