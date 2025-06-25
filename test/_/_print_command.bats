#!/usr/bin/env bats

setup() {
    if [ $(basename $(pwd)) = "_" ]; then
        source ../../showtime.sh
    else
        source showtime.sh
    fi
}

@test "test _print_command()" {
    run _print_command 'echo test'
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" == *"echo test"* ]]
}

@test "test _print_command() with QUIET=true" {
    QUIET=true run _print_command 'echo test'
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = "" ]]
} 

@test "test _print_command() with DRYRUN=true" {
    DRYRUN=true run _print_command 'echo test'
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = *"echo test"* ]]
}

@test "test _print_command() with EXPORT=true" {
    EXPORT=true run _print_command 'echo test'
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = "echo test" ]]
}