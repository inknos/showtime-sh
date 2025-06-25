#!/usr/bin/env bats

setup() {
    if [ $(basename $(pwd)) = "_" ]; then
        source ../../showtime.sh
    else
        source showtime.sh
    fi
}

@test "_print_error" {
    run _print_error 'test error'
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" == *"ERR: test error"* ]]
    [[ "${lines[0]}" == *"✗"* ]]
}

@test "DRYRUN=true _print_error" {
    DRYRUN=true run _print_error 'test error'
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = *"ERR: test error"* ]]
    [[ "${lines[0]}" = *"✗"* ]]
}

@test "EXPORT=true _print_error" {
    EXPORT=true run _print_error 'test error'
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = "# ERR: test error" ]]
}

@test "QUIET=true _print_error" {
    QUIET=true run _print_error 'test error'
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = "" ]]
} 