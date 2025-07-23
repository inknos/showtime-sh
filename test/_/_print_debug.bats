#!/usr/bin/env bats

setup() {
    load ../test_helper/bats-support/load
    load ../test_helper/bats-assert/load
    load ../import_showtime.bash
}

@test "S_DEBUG is set" {
    [[ -n "$S_DEBUG" ]]
}

@test "_print_debug" {
    run _print_debug 'debug message'
    assert_failure
    assert_output ""
}

@test "DEBUG=true _print_debug" {
    DEBUG=true run _print_debug 'debug message'
    assert_success
    # shellcheck disable=SC2153 # {C,S}_DEBUG are confused and not found
    assert_output "${C_DEBUG@E}${S_DEBUG}${NC@E} ${C_DEBUG_TEXT@E}debug message${NC@E}"
}

@test "DEBUG=true DRYRUN=true _print_debug" {
    DEBUG=true DRYRUN=true run _print_debug 'debug message'
    assert_success
    # shellcheck disable=SC2153 # {C,S}_DEBUG are confused and not found
    assert_output "${C_DEBUG@E}${S_DEBUG}${NC@E} ${C_DEBUG_TEXT@E}debug message${NC@E}"
}

# Debug overrides quiet
@test "DEBUG=true QUIET=true _print_debug" {
    DEBUG=true QUIET=true run _print_debug 'debug message'
    assert_success
    # shellcheck disable=SC2153 # {C,S}_DEBUG are confused and not found
    assert_output "${C_DEBUG@E}${S_DEBUG}${NC@E} ${C_DEBUG_TEXT@E}debug message${NC@E}"
}

@test "DEBUG=true _print_debug with custom symbol" {
    DEBUG=true S_DEBUG=">" run _print_debug "debug message"
    assert_success
    # shellcheck disable=SC2153 # {C,S}_DEBUG are confused and not found
    assert_output "${C_DEBUG@E}>${NC@E} ${C_DEBUG_TEXT@E}debug message${NC@E}"
}

# Debug overrides export
@test "DEBUG=true EXPORT_FORMAT=sh _print_debug" {
    DEBUG=true EXPORT_FORMAT=sh run _print_debug "debug message"
    assert_success
    # shellcheck disable=SC2153 # {C,S}_DEBUG are confused and not found
    assert_output "${C_DEBUG@E}${S_DEBUG}${NC@E} ${C_DEBUG_TEXT@E}debug message${NC@E}"
}

@test "DEBUG=true EXPORT_FORMAT=sh _print_debug with custom symbol" {
    DEBUG=true EXPORT_FORMAT=sh S_DEBUG=">" run _print_debug "debug message"
    assert_success
    # shellcheck disable=SC2153 # {C,S}_DEBUG are confused and not found
    assert_output "${C_DEBUG@E}>${NC@E} ${C_DEBUG_TEXT@E}debug message${NC@E}"
}

@test "DEBUG=true EXPORT_FORMAT='md' _print_debug" {
    DEBUG=true EXPORT_FORMAT='md' run _print_debug "debug message"
    assert_success
    # shellcheck disable=SC2153 # {C,S}_DEBUG are confused and not found
    assert_output "${C_DEBUG@E}${S_DEBUG}${NC@E} ${C_DEBUG_TEXT@E}debug message${NC@E}"
}
