#!/usr/bin/env bats

source ../showtime.sh

@test "test _print_info()" {
    result="$(_print_info 'test info')"
    [[ "$result" == *"INF: test info"* ]]
    [[ "$result" == *"ℹ"* ]]
}

@test "test _print_info() with QUIET=true" {
    result="$(QUIET=true _print_info 'test info')"
    [[ "$result" == "" ]]
} 