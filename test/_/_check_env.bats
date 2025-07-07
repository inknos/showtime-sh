#!/usr/bin/env bats

# Check that the environment variables are set correctly and
# ensure that conflicts are detected.

setup() {
    load ../import_showtime.bash
    unset QUIET
    unset DRYRUN
    unset EXPORT
    unset DEBUG
}

@test "_check_env" {
    run _check_env
    (( status == 0 ))
}

@test "DEBUG=true _check_env" {
    DEBUG=true run _check_env
    (( status == 0 ))
}

@test "DRYRUN=true _check_env" {
    DRYRUN=true run _check_env
    (( status == 0 ))
}

@test "EXPORT=true _check_env" {
    EXPORT=true run _check_env
    (( status == 0 ))
}

@test "EXPORT_FORMAT=sh _check_env" {
    EXPORT_FORMAT=sh run _check_env
    (( status == 0 ))
}

@test "EXPORT_FORMAT=invalid _check_env" {
    EXPORT_FORMAT=invalid run _check_env
    (( status == 1 ))
    [[ "${lines[0]}" = "ERROR: EXPORT_FORMAT must be 'sh' or 'md', got: 'invalid'" ]]
}

@test "QUIET=true _check_env" {
    QUIET=true run _check_env
    (( status == 0 ))
}

@test "QUIET=true DRYRUN=true _check_env" {
    # QUIET: true
    # DRYRUN: true
    QUIET=true DRYRUN=true run _check_env
    (( status == 0 ))
}

@test "QUIET=true EXPORT=true _check_env" {
    # QUIET: true
    # EXPORT: true
    QUIET=true EXPORT=true run _check_env
    (( status == 0 ))
}

@test "QUIET=true DEBUG=true _check_env" {
    # QUIET: true
    # DEBUG: true
    QUIET=true DEBUG=true run _check_env
    (( status == 0 ))
}

@test "DRYRUN=true EXPORT=true _check_env" {
    # DRYRUN: true
    # EXPORT: true
    DRYRUN=true EXPORT=true run _check_env
    (( status == 0 ))
}

@test "DRYRUN=true DEBUG=true _check_env" {
    # DRYRUN: true
    # DEBUG: true
    DRYRUN=true DEBUG=true run _check_env
    (( status == 0 ))
}

@test "EXPORT=true DEBUG=true _check_env" {
    # EXPORT: true
    # DEBUG: true
    EXPORT=true DEBUG=true run _check_env
    (( status == 0 ))
}

@test "QUIET=true DRYRUN=true EXPORT_FORMAT=sh _check_env" {
    # QUIET: true
    # DRYRUN: true
    # EXPORT_FORMAT: sh
    QUIET=true DRYRUN=true EXPORT_FORMAT=sh run _check_env
    (( status == 1 ))
    [[ "${lines[0]}" = "ERROR: EXPORT can't be set with QUIET and DRYRUN" ]]
    [[ "${lines[1]}" = "DEBUG: " ]]
    [[ "${lines[2]}" = "DRYRUN: true" ]]
    [[ "${lines[3]}" = "EXPORT: true" ]]
    [[ "${lines[4]}" = "EXPORT_FORMAT: sh" ]]
    [[ "${lines[5]}" = "QUIET: true" ]]
}

@test "QUIET=true DRYRUN=true EXPORT=true _check_env" {
    # QUIET: true
    # DRYRUN: true
    # EXPORT: true
    QUIET=true DRYRUN=true EXPORT=true run _check_env
    (( status == 1 ))
    [[ "${lines[0]}" = "ERROR: EXPORT can't be set with QUIET and DRYRUN" ]]
    [[ "${lines[1]}" = "DEBUG: " ]]
    [[ "${lines[2]}" = "DRYRUN: true" ]]
    [[ "${lines[3]}" = "EXPORT: true" ]]
    [[ "${lines[4]}" = "EXPORT_FORMAT: " ]]
    [[ "${lines[5]}" = "QUIET: true" ]]
}

@test "QUIET=true DRYRUN=true DEBUG=true _check_env" {
    # QUIET: true
    # DRYRUN: true
    # DEBUG: true
    QUIET=true DRYRUN=true DEBUG=true run _check_env
    (( status == 0 ))
}

@test "DRYRUN=true EXPORT=true DEBUG=true _check_env" {
    # DRYRUN: true
    # EXPORT: true
    # DEBUG: true
    DRYRUN=true EXPORT=true DEBUG=true run _check_env
    (( status == 0 ))
}


@test "QUIET=true DRYRUN=true EXPORT=true DEBUG=true _check_env" {
    # QUIET: true
    # DRYRUN: true
    # EXPORT: true
    # DEBUG: true
    QUIET=true DRYRUN=true EXPORT=true DEBUG=true run _check_env
    (( status == 1 ))
    [[ "${lines[0]}" = "ERROR: EXPORT can't be set with QUIET and DRYRUN" ]]
    [[ "${lines[1]}" = "DEBUG: true" ]]
    [[ "${lines[2]}" = "DRYRUN: true" ]]
    [[ "${lines[3]}" = "EXPORT: true" ]]
    [[ "${lines[4]}" = "EXPORT_FORMAT: " ]]
    [[ "${lines[5]}" = "QUIET: true" ]]
}