#!/usr/bin/env bats

source ../showtime.sh

@test "test _print_debug_short_separator()" {
    result="$(_print_debug_short_separator)"
    [[ "$result" == "" ]]
}

@test "test _print_debug_short_separator() with DEBUG=true" {
    result="$(DEBUG=true _print_debug_short_separator)"
    [[ "$result" == *"---"* ]]
} 