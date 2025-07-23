#!/usr/bin/env bats

setup() {
    load ../test_helper/bats-support/load
    load ../test_helper/bats-assert/load
    load ../import_showtime.bash
}

@test "_print_info" {
    run _print_info 'test info'
    assert_success
    assert_output "${C_INFO@E}${S_INFO} test info${NC@E}"
}

@test "DRY_RUN=true _print_info" {
    DRY_RUN=true run _print_info 'test info'
    assert_success
    assert_output "${C_INFO@E}${S_INFO} test info${NC@E}"
}

@test "EXPORT_FORMAT='sh' _print_info" {
    EXPORT_FORMAT='sh' run _print_info 'test info'
    assert_success
    assert_output "# INF: test info"
}

@test "EXPORT_FORMAT='md' _print_info" {
    EXPORT_FORMAT='md' run _print_info 'test info'
    assert_success
    assert_output "INF: test info"
}

@test "QUIET=true _print_info" {
    QUIET=true run _print_info 'test info'
    assert_success
    assert_output ""
}
