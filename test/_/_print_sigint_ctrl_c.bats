#!/usr/bin/env bats

setup() {
    load ../test_helper/bats-support/load
    load ../test_helper/bats-assert/load
    load ../import_showtime.bash
}

@test "_print_sigint_ctrl_c" {
    run _print_sigint_ctrl_c
    assert_success
    assert_output "
${C_INTERACTIVE@E}Ctrl+C detected - press Ctrl+C again within 2 seconds to exit demo${NC@E}"
}

@test "DRY_RUN=true _print_sigint_ctrl_c" {
    DRY_RUN=true run _print_sigint_ctrl_c
    assert_success
    assert_output "
${C_INTERACTIVE@E}Ctrl+C detected - press Ctrl+C again within 2 seconds to exit demo${NC@E}"
}

@test "EXPORT_FORMAT='sh' _print_sigint_ctrl_c" {
    EXPORT_FORMAT='sh' run _print_sigint_ctrl_c
    assert_success
    assert_output ""
}

@test "EXPORT_FORMAT='md' _print_sigint_ctrl_c" {
    EXPORT_FORMAT='md' run _print_sigint_ctrl_c
    assert_success
    assert_output ""
}

@test "QUIET=true _print_sigint_ctrl_c" {
    QUIET=true run _print_sigint_ctrl_c
    assert_success
    assert_output ""
}
