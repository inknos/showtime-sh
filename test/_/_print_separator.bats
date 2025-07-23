#!/usr/bin/env bats

setup() {
    export BATS_LIB_PATH=${BATS_LIB_PATH:-"/usr/lib"}
    bats_load_library bats-support
    bats_load_library bats-assert

    load ../import_showtime.bash
}

@test "_print_separator" {
    run _print_separator
    assert_success
    assert_output "${C_SEPARATOR@E}----------------------------------------${NC@E}"
}

@test "DRY_RUN=true _print_separator" {
    DRY_RUN=true run _print_separator
    assert_success
    assert_output "${C_SEPARATOR@E}----------------------------------------${NC@E}"
}

@test "EXPORT_FORMAT='sh' _print_separator" {
    EXPORT_FORMAT='sh' run _print_separator
    assert_success
    assert_output "# ----------------------------------------"
}

@test "EXPORT_FORMAT='md' _print_separator" {
    EXPORT_FORMAT='md' run _print_separator
    assert_success
    assert_output "---"
}

@test "QUIET=true _print_separator" {
    QUIET=true run _print_separator
    assert_success
    assert_output ""
}
