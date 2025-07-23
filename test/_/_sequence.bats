#!/usr/bin/env bats

setup() {
    export BATS_LIB_PATH=${BATS_LIB_PATH:-"/usr/lib"}
    bats_load_library bats-support
    bats_load_library bats-assert

    load ../import_showtime.bash
}

teardown() {
    LINE_LENGTH=80
}

@test "_sequence" {
    assert_equal "$(_sequence)" "$(printf '=%.0s' {1..80})"
}

@test "_sequence with custom length" {
    export LINE_LENGTH=10
    assert_equal "$(_sequence)" "$(printf '=%.0s' {1..10})"
}

@test "_sequence with custom length as input" {
    assert_equal "$(_sequence 10)" "$(printf '=%.0s' {1..10})"
}
