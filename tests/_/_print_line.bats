#!/usr/bin/env bats

source ../showtime.sh

@test "test _print_line()" {
    result="$(_print_line 'test message')"
    [[ "$result" == *"test message"* ]]
}

@test "test _print_line() with QUIET=true" {
    result="$(QUIET=true _print_line 'test message')"
    [[ "$result" == "" ]]
} 