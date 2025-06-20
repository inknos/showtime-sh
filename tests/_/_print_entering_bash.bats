#!/usr/bin/env bats

source ../showtime.sh

@test "test _print_entering_bash()" {
    result="$(_print_entering_bash)"
    [[ "$result" == *"Entering bash"* ]]
}

@test "test _print_entering_bash() with QUIET=true" {
    result="$(QUIET=true _print_entering_bash)"
    [[ "$result" == "" ]]
} 