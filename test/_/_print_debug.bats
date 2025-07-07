#!/usr/bin/env bats

setup() {
    load ../import_showtime.bash
}

@test "S_DEBUG is set" {
    [[ -n "$S_DEBUG" ]]
}

@test "_print_debug" {
    run _print_debug 'debug message'
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = "" ]]
}

@test "DEBUG=true _print_debug" {
    DEBUG=true run _print_debug 'debug message'
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = "${C_DEBUG@E}${S_DEBUG}${NC@E} ${C_DEBUG_TEXT@E}debug message${NC@E}" ]]
} 

@test "DEBUG=true DRYRUN=true _print_debug" {
    DEBUG=true DRYRUN=true run _print_debug 'debug message'
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = "${C_DEBUG@E}${S_DEBUG}${NC@E} ${C_DEBUG_TEXT@E}debug message${NC@E}" ]]
}

# Debug overrides quiet
@test "DEBUG=true QUIET=true _print_debug" {
    DEBUG=true QUIET=true run _print_debug 'debug message'
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = "${C_DEBUG@E}${S_DEBUG}${NC@E} ${C_DEBUG_TEXT@E}debug message${NC@E}" ]]
}

@test "DEBUG=true _print_debug with custom symbol" {
    DEBUG=true S_DEBUG=">" run _print_debug "debug message"
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = "${C_DEBUG@E}>${NC@E} ${C_DEBUG_TEXT@E}debug message${NC@E}" ]]
}

# Debug overrides export
@test "DEBUG=true EXPORT=true _print_debug" {
    DEBUG=true EXPORT=true run _print_debug "debug message"
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = "${C_DEBUG@E}${S_DEBUG}${NC@E} ${C_DEBUG_TEXT@E}debug message${NC@E}" ]]
}

@test "DEBUG=true EXPORT=true _print_debug with custom symbol" {
    DEBUG=true EXPORT=true S_DEBUG=">" run _print_debug "debug message"
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = "${C_DEBUG@E}>${NC@E} ${C_DEBUG_TEXT@E}debug message${NC@E}" ]]
}