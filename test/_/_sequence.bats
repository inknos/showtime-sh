#!/usr/bin/env bats

setup() {
    load ../test_helper/bats-support/load
    load ../test_helper/bats-assert/load
    load ../import_showtime.bash
}

teardown() {
    LINE_LENGTH=78
}

@test "_sequence" {
    assert_equal "$(_sequence)" "$(printf '=%.0s' {1..78})"
}

@test "_sequence with custom length" {
    export LINE_LENGTH=10
    assert_equal "$(_sequence)" "$(printf '=%.0s' {1..10})"
}
