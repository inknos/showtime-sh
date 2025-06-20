#!/usr/bin/env bats

setup() {
    source showtime.sh
}

function debug_info_test { #@test
    run debug_info
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = "QUIET: " ]]
    [[ "${lines[1]}" = "DRYRUN: " ]]
    [[ "${lines[2]}" = "EXPORT: " ]]
    [[ "${lines[3]}" = "DEBUG: " ]]
}

function debug_info_test_quiet_eq_true { #@test
    QUIET=true run debug_info
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = "QUIET: true" ]]
    [[ "${lines[1]}" = "DRYRUN: " ]]
    [[ "${lines[2]}" = "EXPORT: " ]]
    [[ "${lines[3]}" = "DEBUG: " ]]
}

function debug_info_test_dryrun_eq_true { #@test
    DRYRUN=true run debug_info
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = "QUIET: " ]]
    [[ "${lines[1]}" = "DRYRUN: true" ]]
    [[ "${lines[2]}" = "EXPORT: " ]]
    [[ "${lines[3]}" = "DEBUG: " ]]
}

function debug_info_test_export_eq_true { #@test
    EXPORT=true run debug_info
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = "QUIET: " ]]
    [[ "${lines[1]}" = "DRYRUN: " ]]
    [[ "${lines[2]}" = "EXPORT: true" ]]
    [[ "${lines[3]}" = "DEBUG: " ]]
}

function debug_info_test_debug_eq_true { #@test
    DEBUG=true run debug_info
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = "QUIET: " ]]
    [[ "${lines[1]}" = "DRYRUN: " ]]
    [[ "${lines[2]}" = "EXPORT: " ]]
    [[ "${lines[3]}" = "DEBUG: true" ]]
}

function debug_info_test_all_eq_true { #@test
    QUIET=true DEBUG=true DRYRUN=true EXPORT=true run debug_info
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = "QUIET: true" ]]
    [[ "${lines[1]}" = "DRYRUN: true" ]]
    [[ "${lines[2]}" = "EXPORT: true" ]]
    [[ "${lines[3]}" = "DEBUG: true" ]]
}