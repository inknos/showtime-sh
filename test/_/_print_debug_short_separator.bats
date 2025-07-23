#!/usr/bin/env bats

setup() {
    export BATS_LIB_PATH=${BATS_LIB_PATH:-"/usr/lib"}
    bats_load_library bats-support
    bats_load_library bats-assert

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
