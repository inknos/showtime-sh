#!/usr/bin/env bats

setup() {
    load ../test_helper/bats-support/load
    load ../test_helper/bats-assert/load
    load ../import_showtime.bash
}

@test "_print_error" {
    run _print_error 'test error'
    assert_success
    assert_output "${C_ERROR@E}${S_ERROR} test error${NC@E}"
}

@test "DRYRUN=true _print_error" {
    DRYRUN=true run _print_error 'test error'
    assert_success
    assert_output "${C_ERROR@E}${S_ERROR} test error${NC@E}"
}

@test "EXPORT_FORMAT='sh' _print_error" {
    EXPORT_FORMAT='sh' run _print_error 'test error'
    assert_success
    assert_output "# ERR: test error"
}

@test "EXPORT_FORMAT='md' _print_error" {
    EXPORT_FORMAT='md' run _print_error 'test error'
    assert_success
    assert_output "ERR: test error"
}

@test "QUIET=true _print_error" {
    QUIET=true run _print_error 'test error'
    assert_success
    assert_output ""
}
