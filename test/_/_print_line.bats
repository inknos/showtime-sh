#!/usr/bin/env bats

setup() {
    export BATS_LIB_PATH=${BATS_LIB_PATH:-"/usr/lib"}
    bats_load_library bats-support
    bats_load_library bats-assert

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
