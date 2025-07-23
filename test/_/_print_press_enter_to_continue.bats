#!/usr/bin/env bats

setup() {
    load ../test_helper/bats-support/load
    load ../test_helper/bats-assert/load
    load ../import_showtime.bash
}

@test "_print_press_enter_to_continue" {
    run _print_press_enter_to_continue
    assert_success
    assert_output "${C_PROMPT@E}Press Enter to continue...${NC@E}"
}

@test "DRY_RUN=true _print_press_enter_to_continue" {
    DRY_RUN=true run _print_press_enter_to_continue
    assert_success
    assert_output "${C_PROMPT@E}Press Enter to continue...${NC@E}"
}

@test "EXPORT_FORMAT='sh' _print_press_enter_to_continue" {
    EXPORT_FORMAT='sh' run _print_press_enter_to_continue
    assert_success
    assert_output ""
}

@test "EXPORT_FORMAT='md' _print_press_enter_to_continue" {
    EXPORT_FORMAT='md' run _print_press_enter_to_continue
    assert_success
    assert_output ""
}

@test "QUIET=true _print_press_enter_to_continue" {
    QUIET=true run _print_press_enter_to_continue
    assert_success
    assert_output ""
}
