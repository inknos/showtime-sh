#!/usr/bin/env bats

source ../showtime.sh

@test "test _print_debug()" {
    result="$(_print_debug 'debug message')"
    [[ "$result" == "" ]]
}

@test "test _print_debug() with DEBUG=true" {
    result="$(DEBUG=true _print_debug 'debug message')"
    [[ "$result" == *"debug message"* ]]
    [[ "$result" == *"$"* ]]
} 