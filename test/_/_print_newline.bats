#!/usr/bin/env bats

setup() {
    load ../test_helper/bats-support/load
    load ../test_helper/bats-assert/load
    load ../import_showtime.bash
}

@test "_print_newline" {
    run _print_newline
    assert_success
    assert_output ""
}

@test "DRY_RUN=true _print_newline" {
    DRY_RUN=true run _print_newline
    assert_success
    assert_output ""
}

@test "EXPORT_FORMAT='sh' _print_newline" {
    EXPORT_FORMAT='sh' run _print_newline
    assert_success
    assert_output ""
}

@test "EXPORT_FORMAT='md' _print_newline" {
    EXPORT_FORMAT='md' run _print_newline
    assert_success
    assert_output ""
}

@test "QUIET=true _print_newline" {
    QUIET=true run _print_newline
    assert_success
    assert_output ""
}
