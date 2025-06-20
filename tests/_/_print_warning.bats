#!/usr/bin/env bats

source ../showtime.sh

@test "test _print_warning()" {
    result="$(_print_warning 'test warning')"
    [[ "$result" == *"WRN: test warning"* ]]
    [[ "$result" == *"⚠"* ]]
}

@test "test _print_warning() with QUIET=true" {
    result="$(QUIET=true _print_warning 'test warning')"
    [[ "$result" == "" ]]
} 