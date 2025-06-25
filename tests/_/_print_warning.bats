#!/usr/bin/env bats

source ../../showtime.sh

@test "_print_warning" {
    run _print_warning 'test warning'
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" == *"WRN: test warning"* ]]
    [[ "${lines[0]}" == *"⚠"* ]]
}

@test "QUIET=true _print_warning" {
    QUIET=true run _print_warning 'test warning'
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = "" ]]
} 