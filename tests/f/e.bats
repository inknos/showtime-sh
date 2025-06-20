#!/usr/bin/env bats

setup() {
    source showtime.sh
}


function e_test { #@test\"" {
    run e "echo test"
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = *"echo test"* ]]
    [[ "${lines[1]}" = *"test"* ]]
}

@test "DRYRUN=true e \"echo test\"" {
    DRYRUN=true run e "echo test"
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = *"echo test"* ]]
    [[ "${lines[1]}" = *"test"* ]]
}

@test "QUIET=true e \"echo test\"" {
    QUIET=true run e "echo test"
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = "" ]]
}
