#!/usr/bin/env bats

setup() {
    export BATS_LIB_PATH=${BATS_LIB_PATH:-"/usr/lib"}
    bats_load_library bats-support
    bats_load_library bats-assert

    load ../import_showtime.bash
}

@test "_trim" {
    assert_equal "$(_trim "  test  ")" "test"
}

@test "_trim with multiple words" {
    assert_equal "$(_trim "test  test   ")" "test  test"
}
