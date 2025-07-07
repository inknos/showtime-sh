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
    [[ "${lines[0]}" = *"${S_DEBUG}"*"debug message"* ]]
} 

@test "DEBUG=true DRYRUN=true _print_debug" {
    DEBUG=true DRYRUN=true run _print_debug 'debug message'
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = *"${S_DEBUG}"*"debug message"* ]]
}

# Debug overrides quiet
@test "DEBUG=true QUIET=true _print_debug" {
    DEBUG=true QUIET=true run _print_debug 'debug message'
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = *"${S_DEBUG}"*"debug message"* ]]
}

@test "DEBUG=true _print_debug with custom symbol" {
    DEBUG=true S_DEBUG=">" run _print_debug "debug message"
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = *">"*"debug message"* ]]
}

# Debug overrides export
@test "DEBUG=true EXPORT=true _print_debug" {
    DEBUG=true EXPORT=true run _print_debug "debug message"
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = *"${S_DEBUG}"*"debug message"* ]]
}

@test "DEBUG=true EXPORT=true _print_debug with custom symbol" {
    DEBUG=true EXPORT=true S_DEBUG=">" run _print_debug "debug message"
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = *">"*"debug message"* ]]
}