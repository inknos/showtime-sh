#!/usr/bin/env bats

source ../showtime.sh

@test "test _print_success()" {
    result="$(_print_success 'test success')"
    [[ "$result" == *"test success"* ]]
    [[ "$result" == *"✓"* ]]
}

@test "test _print_success() with QUIET=true" {
    result="$(QUIET=true _print_success 'test success')"
    [[ "$result" == "" ]]
} 