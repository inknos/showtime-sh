#!/usr/bin/env bats

setup() {
    source showtime.sh
    unset QUIET
    unset DRYRUN
    unset EXPORT
    unset DEBUG
}

@test "_check_env" {
    run _check_env
    [ "$status" -eq 0 ]
}

@test "QUIET=true _check_env" {
    QUIET=true run _check_env
    [ "$status" -eq 0 ]
}

@test "DRYRUN=true _check_env" {
    DRYRUN=true run _check_env
    [ "$status" -eq 0 ]
}

@test "EXPORT=true _check_env" {
    EXPORT=true run _check_env
    [ "$status" -eq 0 ]
}

@test "QUIET=true DRYRUN=true _check_env" {
    # QUIET: true
    # DRYRUN: true
    QUIET=true DRYRUN=true run _check_env
    [ "$status" -eq 0 ]
}

@test "QUIET=true EXPORT=true _check_env" {
    # QUIET: true
    # EXPORT: true
    QUIET=true EXPORT=true run _check_env
    [ "$status" -eq 0 ]
}

@test "QUIET=true DEBUG=true _check_env" {
    # QUIET: true
    # DEBUG: true
    QUIET=true DEBUG=true run _check_env
    [ "$status" -eq 0 ]
}

@test "DRYRUN=true EXPORT=true _check_env" {
    # DRYRUN: true
    # EXPORT: true
    DRYRUN=true EXPORT=true run _check_env
    [ "$status" -eq 0 ]
}

@test "DRYRUN=true DEBUG=true _check_env" {
    # DRYRUN: true
    # DEBUG: true
    DRYRUN=true DEBUG=true run _check_env
    [ "$status" -eq 0 ]
}

@test "EXPORT=true DEBUG=true _check_env" {
    # EXPORT: true
    # DEBUG: true
    EXPORT=true DEBUG=true run _check_env
    [ "$status" -eq 0 ]
}

@test "QUIET=true DRYRUN=true EXPORT=true _check_env" {
    # QUIET: true
    # DRYRUN: true
    # EXPORT: true
    QUIET=true DRYRUN=true EXPORT=true run _check_env
    [ "$status" -eq 1 ]
    [[ "${lines[0]}" = "ERROR: EXPORT can't be set with QUIET and DRYRUN" ]]
    [[ "${lines[1]}" = "QUIET: true" ]]
    [[ "${lines[2]}" = "DRYRUN: true" ]]
    [[ "${lines[3]}" = "EXPORT: true" ]]
    [[ "${lines[4]}" = "DEBUG: " ]]
}

@test "QUIET=true DRYRUN=true DEBUG=true _check_env" {
    # QUIET: true
    # DRYRUN: true
    # DEBUG: true
    QUIET=true DRYRUN=true DEBUG=true run _check_env
    [ "$status" -eq 0 ]
}

@test "DRYRUN=true EXPORT=true DEBUG=true _check_env" {
    # DRYRUN: true
    # EXPORT: true
    # DEBUG: true
    DRYRUN=true EXPORT=true DEBUG=true run _check_env
    [ "$status" -eq 0 ]
}

@test "QUIET=true DRYRUN=true EXPORT=true DEBUG=true _check_env" {
    # QUIET: true
    # DRYRUN: true
    # EXPORT: true
    # DEBUG: true
    QUIET=true DRYRUN=true EXPORT=true DEBUG=true run _check_env
    [ "$status" -eq 1 ]
    [[ "${lines[0]}" = "ERROR: EXPORT can't be set with QUIET and DRYRUN" ]]
    [[ "${lines[1]}" = "QUIET: true" ]]
    [[ "${lines[2]}" = "DRYRUN: true" ]]
    [[ "${lines[3]}" = "EXPORT: true" ]]
    [[ "${lines[4]}" = "DEBUG: true" ]]
}