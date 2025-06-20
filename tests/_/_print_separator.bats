#!/usr/bin/env bats

source ../showtime.sh

@test "test _print_separator()" {
    result="$(_print_separator)"
    [[ "$result" == *"----"* ]]
}

@test "test _print_separator() with QUIET=true" {
    result="$(QUIET=true _print_separator)"
    [[ "$result" == "" ]]
} 