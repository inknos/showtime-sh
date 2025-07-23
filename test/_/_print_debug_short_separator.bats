#!/usr/bin/env bats

setup() {
    load ../test_helper/bats-support/load
    load ../test_helper/bats-assert/load
    load ../import_showtime.bash
}

@test "_print_debug_short_separator" {
    run _print_debug_short_separator
    assert_failure
    assert_output ""
}

@test "DEBUG=true _print_debug_short_separator" {
    DEBUG=true run _print_debug_short_separator
    assert_success
    assert_output "${C_DEBUG@E}---${NC@E}"
}
