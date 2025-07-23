#!/usr/bin/env bats

setup() {
    load ../test_helper/bats-support/load
    load ../test_helper/bats-assert/load
    load ../import_showtime.bash
}

@test "pe \"test\"" {
    run pe 'test'
    assert_success
    assert_output "${C_ERROR@E}${S_ERROR} test${NC@E}"
}

@test "DRYRUN=true pe \"test\"" {
    DRYRUN=true run pe 'test'
    assert_success
    assert_output "${C_ERROR@E}${S_ERROR} test${NC@E}"
}

@test "EXPORT_FORMAT=sh pe \"test\"" {
    EXPORT_FORMAT="sh" run pe 'test'
    assert_success
    assert_output "# ERR: test"
}

@test "EXPORT_FORMAT=md pe \"test\"" {
    EXPORT_FORMAT="md" run pe 'test'
    assert_success
    assert_output "ERR: test"
}

@test "QUIET=true pe \"test\"" {
    QUIET=true run pe 'test'
    assert_success
    assert_output ""
}
