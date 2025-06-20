#!/usr/bin/env bats

source ../showtime.sh

@test "test _print_press_enter_to_continue()" {
    result="$(_print_press_enter_to_continue)"
    [[ "$result" == *"Press Enter to continue"* ]]
}

@test "test _print_press_enter_to_continue() with QUIET=true" {
    result="$(QUIET=true _print_press_enter_to_continue)"
    [[ "$result" == "" ]]
} 