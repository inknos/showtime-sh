#!/usr/bin/env bats

source ../showtime.sh

@test "test _print_sigint_ctrl_c()" {
    result="$(_print_sigint_ctrl_c)"
    [[ "$result" == *"Ctrl+C detected"* ]]
}

@test "test _print_sigint_ctrl_c() with QUIET=true" {
    result="$(QUIET=true _print_sigint_ctrl_c)"
    [[ "$result" == "" ]]
} 