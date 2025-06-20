#!/usr/bin/env bats

source ../showtime.sh

@test "test _print_newline()" {
    result="$(_print_newline)"
    [[ "$result" == $'\n' ]]
}

@test "test _print_newline() with QUIET=true" {
    result="$(QUIET=true _print_newline)"
    [[ "$result" == "" ]]
} 