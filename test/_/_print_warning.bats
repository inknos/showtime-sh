#!/usr/bin/env bats

setup() {
    load ../test_helper/bats-support/load
    load ../test_helper/bats-assert/load
    load ../import_showtime.bash
}


@test "S_WARNING is set" {
    [[ -n "$S_WARNING" ]]
}

@test "_print_warning" {
    run _print_warning 'test warning'
    assert_success
    # shellcheck disable=SC2153 # {C,S}_WARNING are confused and not found
    assert_output "
${C_WARNING@E}${S_WARNING} test warning${NC@E}"
}

@test "_print_warning with custom symbol" {
    S_WARNING="W:" run _print_warning 'test warning'
    assert_success
    # shellcheck disable=SC2153 # {C,S}_WARNING are confused and not found
    assert_output "
${C_WARNING@E}W: test warning${NC@E}"
}

@test "DRY_RUN=true _print_warning" {
    DRY_RUN=true run _print_warning 'test warning'
    assert_success
    # shellcheck disable=SC2153 # {C,S}_WARNING are confused and not found
    assert_output "
${C_WARNING@E}${S_WARNING} test warning${NC@E}"
}

@test "DRY_RUN=true _print_warning with custom symbol" {
    DRY_RUN=true S_WARNING="W:" run _print_warning 'test warning'
    assert_success
    # shellcheck disable=SC2153 # {C,S}_WARNING are confused and not found
    assert_output "
${C_WARNING@E}W: test warning${NC@E}"
}

@test "EXPORT_FORMAT='sh' _print_warning" {
    EXPORT_FORMAT='sh' run _print_warning 'test warning'
    assert_success
    assert_output "# WRN: test warning"
}

@test "EXPORT_FORMAT='sh' _print_warning with custom symbol changes nothing" {
    EXPORT_FORMAT='sh' S_WARNING="W:" run _print_warning 'test warning'
    assert_success
    assert_output "# WRN: test warning"
}

@test "EXPORT_FORMAT='md' _print_warning" {
    EXPORT_FORMAT='md' run _print_warning 'test warning'
    assert_success
    assert_output "WRN: test warning"
}

@test "EXPORT_FORMAT='md' _print_warning with custom symbol changes nothing" {
    EXPORT_FORMAT='md' S_WARNING="W:" run _print_warning 'test warning'
    assert_success
    assert_output "WRN: test warning"
}

@test "QUIET=true _print_warning" {
    QUIET=true run _print_warning 'test warning'
    assert_success
    assert_output ""
}
