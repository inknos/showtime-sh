#!/usr/bin/env bats

source ../showtime.sh

@test "test _print_error()" {
    result="$(_print_error 'test error')"
    [[ "$result" == *"ERR: test error"* ]]
    [[ "$result" == *"✗"* ]]
}

@test "test _print_error() with QUIET=true" {
    result="$(QUIET=true _print_error 'test error')"
    [[ "$result" == "" ]]
} 