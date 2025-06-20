#!/usr/bin/env bats

source ../showtime.sh

@test "test _print_first_line()" {
    result="$(_print_first_line 'test message')"
    [[ "$result" == *"test message"* ]]
}

@test "test _print_first_line() with QUIET=true" {
    result="$(QUIET=true _print_first_line 'test message')"
    [[ "$result" == "" ]]
} 