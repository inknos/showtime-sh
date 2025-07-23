#!/usr/bin/env bats

setup() {
    load ../test_helper/bats-support/load
    load ../test_helper/bats-assert/load
    load ../import_showtime.bash
}

@test "_print_line" {
    run _print_line 'test message'
    assert_success
    assert_output "  ${C_TEXT@E}test message${NC@E}"
}

@test "DRY_RUN=true _print_line" {
    DRY_RUN=true run _print_line 'test message'
    assert_success
    assert_output "  ${C_TEXT@E}test message${NC@E}"
}

@test "EXPORT_FORMAT='sh' _print_line" {
    EXPORT_FORMAT='sh' run _print_line 'test message'
    assert_success
    assert_output "# test message"
}

@test "EXPORT_FORMAT='md' _print_line" {
    EXPORT_FORMAT='md' run _print_line 'test message'
    assert_success
    assert_output "test message"
}

@test "QUIET=true _print_line" {
    QUIET=true run _print_line 'test message'
    assert_success
    assert_output ""
}
