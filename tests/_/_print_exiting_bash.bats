#!/usr/bin/env bats

source ../showtime.sh

@test "test _print_exiting_bash()" {
    result="$(_print_exiting_bash)"
    [[ "$result" == *"Entering bash"* ]]
}

@test "test _print_exiting_bash() with QUIET=true" {
    result="$(QUIET=true _print_exiting_bash)"
    [[ "$result" == "" ]]
} 