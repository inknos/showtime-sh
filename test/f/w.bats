#! /usr/bin/env bats

setup() {
    load ../test_helper/bats-support/load
    load ../test_helper/bats-assert/load
    load ../import_showtime.bash
}

@test "w with timeout" {
    bats_require_minimum_version 1.5.0
    run -142 w 0.1
    assert_failure
    assert_output "${C_PROMPT@E}Press Enter to continue...${NC@E}"
}

@test "w with timeout and GOON=true" {
    bats_require_minimum_version 1.5.0
    GOON=true run w 0.1
    assert_success
    assert_output ""
}

# Verify that w will actually wait for timeout by seeing the error code
@test "w with timeout and QUIET=true" {
    bats_require_minimum_version 1.5.0
    QUIET=true run w 0.1
    assert_failure
    assert_output ""
}
