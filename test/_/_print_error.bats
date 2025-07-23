#!/usr/bin/env bats

setup() {
    export BATS_LIB_PATH=${BATS_LIB_PATH:-"/usr/lib"}
    bats_load_library bats-support
    bats_load_library bats-assert

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
