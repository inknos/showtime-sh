#!/usr/bin/env bats

setup() {
    export BATS_LIB_PATH=${BATS_LIB_PATH:-"/usr/lib"}
    bats_load_library bats-support
    bats_load_library bats-assert

    load ../import_showtime.bash
}

@test "_print_entering_bash" {
    run _print_entering_bash
    assert_success
    assert_output "${C_INTERACTIVE@E}Entering bash...${NC@E}"
}

@test "DRYRUN=true _print_entering_bash" {
    DRYRUN=true run _print_entering_bash
    assert_success
    assert_output "${C_INTERACTIVE@E}Entering bash...${NC@E}"
}

@test "EXPORT_FORMAT='sh' _print_entering_bash" {
    EXPORT_FORMAT='sh' run _print_entering_bash
    assert_success
    assert_output ""
}

@test "EXPORT_FORMAT='md' _print_entering_bash" {
    EXPORT_FORMAT='md' run _print_entering_bash
    assert_success
    assert_output ""
}

@test "QUIET=true _print_entering_bash" {
    QUIET=true run _print_entering_bash
    assert_success
    assert_output ""
}
