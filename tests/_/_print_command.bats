#!/usr/bin/env bats

source ../../showtime.sh

@test "test _print_command()" {
    run _print_command 'echo test'
    [[ "${lines[0]}" == *"echo test"* ]]
    [ "$status" -eq 0 ]
}

@test "test _print_command() with QUIET=true" {
    QUIET=true run _print_command 'echo test'
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = "" ]]
} 

@test "test _print_command() with DRYRUN=true" {
    DRYRUN=true run _print_command 'echo test'
    [[ "${lines[0]}" = "echo test" ]]
    [ "$status" -eq 0 ]
}

@test "test _print_command() with EXPORT=true" {
    EXPORT=true run _print_command 'echo test'
    [[ "${lines[0]}" = "# echo test" ]]
    [ "$status" -eq 0 ]
}