#!/usr/bin/env bats

setup() {
    if [ $(basename $(pwd)) = "_" ]; then
        source ../../showtime.sh
    else
        source showtime.sh
    fi
}

@test "_print_info" {
    run _print_info 'test info'
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = *"INF: test info"* ]]
    [[ "${lines[0]}" = *"ℹ"* ]]
}

@test "DRY_RUN=true _print_info" {
    DRY_RUN=true run _print_info 'test info'
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = *"INF: test info"* ]]
    [[ "${lines[0]}" = *"ℹ"* ]]
}

@test "EXPORT=true _print_info" {
    EXPORT=true run _print_info 'test info'
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = "# INF: test info" ]]
}

@test "QUIET=true _print_info" {
    QUIET=true run _print_info 'test info'
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = "" ]]
} 