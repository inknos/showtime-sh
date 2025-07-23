#!/usr/bin/env bats

setup() {
    load ../test_helper/bats-support/load
    load ../test_helper/bats-assert/load
    load ../import_showtime.bash
}

@test "_clear" {
    # Since _clear() calls the clear command, we can only test it doesn't error
    run _clear
    assert_success
}

@test "DRYRUN=true _clear" {
    DRYRUN=true run _clear
    assert_success
}

@test "QUIET=true _clear" {
    QUIET=true run _clear
    assert_success
}

@test "EXPORT_FORMAT='sh' _clear" {
    EXPORT_FORMAT='sh' run _clear
    assert_success
}
