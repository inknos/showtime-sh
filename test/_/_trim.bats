#!/usr/bin/env bats

setup() {
    load ../test_helper/bats-support/load
    load ../test_helper/bats-assert/load
    load ../import_showtime.bash
}

@test "_trim" {
    assert_equal "$(_trim "  test  ")" "test"
}

@test "_trim with multiple words" {
    assert_equal "$(_trim "test  test   ")" "test  test"
}
