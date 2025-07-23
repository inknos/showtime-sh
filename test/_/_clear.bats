#!/usr/bin/env bats

setup() {
    export BATS_LIB_PATH=${BATS_LIB_PATH:-"/usr/lib"}
    bats_load_library bats-support
    bats_load_library bats-assert

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
