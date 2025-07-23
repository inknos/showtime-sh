#!/usr/bin/env bats

setup() {
    load ../test_helper/bats-support/load
    load ../test_helper/bats-assert/load
    load ../import_showtime.bash
}

@test "_print_success" {
    run _print_success 'test success'
    assert_success
    assert_output "
${C_SUCCESS@E}${S_SUCCESS} test success${NC@E}"
}

@test "_print_success with custom symbol" {
    S_SUCCESS="S:" run _print_success 'test success'
    assert_success
    assert_output "
${C_SUCCESS@E}S: test success${NC@E}"
}

@test "DRY_RUN=true _print_success" {
    DRY_RUN=true run _print_success 'test success'
    assert_success
    assert_output "
${C_SUCCESS@E}${S_SUCCESS} test success${NC@E}"
}

@test "DRY_RUN=true _print_success with custom symbol" {
    DRY_RUN=true S_SUCCESS="S:" run _print_success 'test success'
    assert_success
    assert_output "
${C_SUCCESS@E}S: test success${NC@E}"
}

@test "EXPORT_FORMAT='sh' _print_success" {
    EXPORT_FORMAT='sh' run _print_success 'test success'
    assert_success
    assert_output "# test success"
}

@test "EXPORT_FORMAT='sh' _print_success with custom symbol changes nothing" {
    EXPORT_FORMAT='sh' S_SUCCESS="S:" run _print_success 'test success'
    assert_success
    assert_output "# test success"
}

@test "EXPORT_FORMAT='md' _print_success" {
    EXPORT_FORMAT='md' run _print_success 'test success'
    assert_success
    assert_output "test success"
}

@test "EXPORT_FORMAT='md' _print_success with custom symbol changes nothing" {
    EXPORT_FORMAT='md' S_SUCCESS="S:" run _print_success 'test success'
    assert_success
    assert_output "test success"
}

@test "QUIET=true _print_success" {
    QUIET=true run _print_success 'test success'
    assert_success
    assert_output ""
}
