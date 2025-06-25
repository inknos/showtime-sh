#!/usr/bin/env bats

setup() {
    if [ $(basename $(pwd)) = "_" ]; then
        source ../../showtime.sh
    else
        source showtime.sh
    fi
}

@test "_print_entering_bash" {
    run _print_entering_bash
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" == *"Entering bash"* ]]
}

@test "DRYRUN=true _print_entering_bash" {
    DRYRUN=true run _print_entering_bash
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = *"Entering bash"* ]]
}

@test "EXPORT=true _print_entering_bash" {
    EXPORT=true run _print_entering_bash
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = "" ]]
}

@test "QUIET=true _print_entering_bash" {
    QUIET=true run _print_entering_bash
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = "" ]]
}