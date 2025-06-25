#!/usr/bin/env bats

setup() {
    if [ $(basename $(pwd)) = "_" ]; then
        source ../../showtime.sh
    else
        source showtime.sh
    fi
}

@test "_print_line" {
    run _print_line 'test message'
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = *"test message"* ]]
}

@test "DRY_RUN=true _print_line" {
    DRY_RUN=true run _print_line 'test message'
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = *"test message"* ]]
}

@test "EXPORT=true _print_line" {
    EXPORT=true run _print_line 'test message'
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = "# test message" ]]
}

@test "QUIET=true _print_line" {
    QUIET=true run _print_line 'test message'
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = "" ]]
} 