#!/usr/bin/env bats

setup() {
    load ../import_showtime.bash
}

@test "debug_info" {
    run debug_info
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = "DEBUG: " ]]
    [[ "${lines[1]}" = "DRYRUN: " ]]
    [[ "${lines[2]}" = "EXPORT: " ]]
    [[ "${lines[3]}" = "EXPORT_FORMAT: " ]]
    [[ "${lines[4]}" = "QUIET: " ]]
}

@test "debug_info with QUIET=true" {
    QUIET=true run debug_info
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = "DEBUG: " ]]
    [[ "${lines[1]}" = "DRYRUN: " ]]
    [[ "${lines[2]}" = "EXPORT: " ]]
    [[ "${lines[3]}" = "EXPORT_FORMAT: " ]]
    [[ "${lines[4]}" = "QUIET: true" ]]
}

@test "debug_info with DRYRUN=true" {
    DRYRUN=true run debug_info
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = "DEBUG: " ]]
    [[ "${lines[1]}" = "DRYRUN: true" ]]
    [[ "${lines[2]}" = "EXPORT: " ]]
    [[ "${lines[3]}" = "EXPORT_FORMAT: " ]]
    [[ "${lines[4]}" = "QUIET: " ]]
}

@test "debug_info with EXPORT=true" {
    EXPORT=true run debug_info
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = "DEBUG: " ]]
    [[ "${lines[1]}" = "DRYRUN: " ]]
    [[ "${lines[2]}" = "EXPORT: true" ]]
    [[ "${lines[3]}" = "EXPORT_FORMAT: " ]]
    [[ "${lines[4]}" = "QUIET: " ]]
}

@test "debug_info with DEBUG=true" {
    DEBUG=true run debug_info
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = "DEBUG: true" ]]
    [[ "${lines[1]}" = "DRYRUN: " ]]
    [[ "${lines[2]}" = "EXPORT: " ]]
    [[ "${lines[3]}" = "EXPORT_FORMAT: " ]]
    [[ "${lines[4]}" = "QUIET: " ]]
}

@test "debug info with EXPORT_FORMAT=sh" {
    EXPORT_FORMAT=sh run debug_info
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = "DEBUG: " ]]
    [[ "${lines[1]}" = "DRYRUN: " ]]
    [[ "${lines[2]}" = "EXPORT: " ]]
    [[ "${lines[3]}" = "EXPORT_FORMAT: sh" ]]
    [[ "${lines[4]}" = "QUIET: " ]]
}

@test "debug_info with all set to true" {
    QUIET=true DEBUG=true DRYRUN=true EXPORT=true run debug_info
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = "DEBUG: true" ]]
    [[ "${lines[1]}" = "DRYRUN: true" ]]
    [[ "${lines[2]}" = "EXPORT: true" ]]
    [[ "${lines[3]}" = "EXPORT_FORMAT: " ]]
    [[ "${lines[4]}" = "QUIET: true" ]]
}