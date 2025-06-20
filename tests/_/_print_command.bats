#!/usr/bin/env bats

source ../showtime.sh

@test "test _print_command()" {
    result="$(_print_command 'echo test')"
    [[ "$result" == *"echo test"* ]]
    [[ "$result" == *"$"* ]]
}

@test "test _print_command() with QUIET=true" {
    result="$(QUIET=true _print_command 'echo test')"
    [[ "$result" == "" ]]
} 