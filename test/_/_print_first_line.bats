#!/usr/bin/env bats

setup() {
    export BATS_LIB_PATH=${BATS_LIB_PATH:-"/usr/lib"}
    bats_load_library bats-support
    bats_load_library bats-assert

    load ../import_showtime.bash
}

@test "S_BULLET is set" {
    [[ -n "$S_BULLET" ]]
}

@test "_print_first_line" {
    run _print_first_line 'test message'
    assert_success
    # shellcheck disable=SC2153
    assert_output "${C_BULLET@E}${S_BULLET}${NC@E} ${C_TEXT@E}test message${NC@E}"
}

@test "_print_first_line with custom symbol" {
    S_BULLET=">" run _print_first_line 'test message'
    assert_success
    assert_output "${C_BULLET@E}>${NC@E} ${C_TEXT@E}test message${NC@E}"
}

@test "DRYRUN=true _print_first_line" {
    DRYRUN=true run _print_first_line 'test message'
    assert_success
    # shellcheck disable=SC2153 # {C,S}_BULLET are confused and not found
    assert_output "${C_BULLET@E}${S_BULLET}${NC@E} ${C_TEXT@E}test message${NC@E}"
}

@test "DRYRUN=true _print_first_line with custom symbol" {
    DRYRUN=true S_BULLET=">" run _print_first_line 'test message'
    assert_success
    assert_output "${C_BULLET@E}>${NC@E} ${C_TEXT@E}test message${NC@E}"
}

@test "EXPORT_FORMAT='sh' _print_first_line" {
    EXPORT_FORMAT='sh' run _print_first_line 'test message'
    assert_success
    assert_output "# test message"
}

@test "EXPORT_FORMAT='sh' _print_first_line with custom symbol does not change the symbol" {
    EXPORT_FORMAT='sh' S_BULLET=">" run _print_first_line 'test message'
    assert_success
    assert_output "# test message"
}

@test "EXPORT_FORMAT='md' _print_first_line" {
    EXPORT_FORMAT='md' run _print_first_line 'test message'
    assert_success
    assert_output "test message"
}

@test "EXPORT_FORMAT='md' _print_first_line with custom symbol does not change the symbol" {
    EXPORT_FORMAT='md' S_BULLET=">" run _print_first_line 'test message'
    assert_success
    assert_output "test message"
}

@test "QUIET=true _print_first_line" {
    QUIET=true run _print_first_line 'test message'
    assert_success
    assert_output ""
}
