#!/usr/bin/env bats

# Check that the environment variables are set correctly and
# ensure that conflicts are detected.

setup() {
    load ../test_helper/bats-support/load
    load ../test_helper/bats-assert/load
    load ../import_showtime.bash
    unset QUIET
    unset DRYRUN
    unset EXPORT
    unset DEBUG
}

@test "_check_env" {
    run _check_env
    assert_success
}

@test "DEBUG=true _check_env" {
    DEBUG=true run _check_env
    assert_success
}

@test "DRYRUN=true _check_env" {
    DRYRUN=true run _check_env
    assert_success
}

@test "EXPORT_FORMAT='sh' _check_env" {
    EXPORT_FORMAT='sh' run _check_env
    assert_success
}

@test "EXPORT_FORMAT='md' _check_env" {
    EXPORT_FORMAT='md' run _check_env
    assert_success
}

@test "EXPORT=true _check_env" {
    EXPORT=true run _check_env
    assert_success
    assert_output "
${C_WARNING@E}${S_WARNING} EXPORT is deprecated, use EXPORT_FORMAT instead${NC@E}"
}

@test "EXPORT_FORMAT=invalid _check_env" {
    EXPORT_FORMAT=invalid run _check_env
    assert_failure
    assert_output --partial "ERROR: EXPORT_FORMAT must be 'sh' or 'md', got: 'invalid'"
    assert_output --partial "DEBUG: "
    assert_output --partial "DRYRUN: "
    assert_output --partial "EXPORT_FORMAT: invalid"
    assert_output --partial "QUIET: "
}

@test "QUIET=true _check_env" {
    QUIET=true run _check_env
    assert_success
}

@test "QUIET=true DRYRUN=true _check_env" {
    # QUIET: true
    # DRYRUN: true
    QUIET=true DRYRUN=true run _check_env
    assert_success
}

@test "QUIET=true EXPORT_FORMAT=sh _check_env" {
    # QUIET: true
    # EXPORT_FORMAT: sh
    QUIET=true EXPORT_FORMAT=sh run _check_env
    assert_success
}

@test "QUIET=true DEBUG=true _check_env" {
    # QUIET: true
    # DEBUG: true
    QUIET=true DEBUG=true run _check_env
    assert_success
}

@test "DRYRUN=true EXPORT_FORMAT=sh _check_env" {
    # DRYRUN: true
    # EXPORT_FORMAT: sh
    DRYRUN=true EXPORT_FORMAT=sh run _check_env
    assert_success
}

@test "DRYRUN=true DEBUG=true _check_env" {
    # DRYRUN: true
    # DEBUG: true
    DRYRUN=true DEBUG=true run _check_env
    assert_success
}

@test "EXPORT_FORMAT=sh DEBUG=true _check_env" {
    # EXPORT_FORMAT: sh
    # DEBUG: true
    EXPORT_FORMAT=sh DEBUG=true run _check_env
    assert_success
}

@test "QUIET=true DRYRUN=true EXPORT_FORMAT=sh _check_env" {
    # QUIET: true
    # DRYRUN: true
    # EXPORT_FORMAT: sh
    QUIET=true DRYRUN=true EXPORT_FORMAT=sh run _check_env
    assert_failure
    assert_output --partial "ERROR: EXPORT_FORMAT can't be set with QUIET and DRYRUN"
    assert_output --partial "DEBUG: "
    assert_output --partial "DRYRUN: true"
    assert_output --partial "EXPORT_FORMAT: sh"
    assert_output --partial "QUIET: true"
}

@test "QUIET=true DRYRUN=true DEBUG=true _check_env" {
    # QUIET: true
    # DRYRUN: true
    # DEBUG: true
    QUIET=true DRYRUN=true DEBUG=true run _check_env
    assert_success
}

@test "DRYRUN=true EXPORT_FORMAT=sh DEBUG=true _check_env" {
    # DRYRUN: true
    # EXPORT_FORMAT: sh
    # DEBUG: true
    DRYRUN=true EXPORT_FORMAT=sh DEBUG=true run _check_env
    assert_success
}


@test "QUIET=true DRYRUN=true EXPORT_FORMAT=sh DEBUG=true _check_env" {
    # QUIET: true
    # DRYRUN: true
    # EXPORT_FORMAT: sh
    # DEBUG: true
    QUIET=true DRYRUN=true EXPORT_FORMAT=sh DEBUG=true run _check_env
    assert_failure
    assert_output --partial "ERROR: EXPORT_FORMAT can't be set with QUIET and DRYRUN"
    assert_output --partial "DEBUG: true"
    assert_output --partial "DRYRUN: true"
    assert_output --partial "EXPORT_FORMAT: sh"
    assert_output --partial "QUIET: true"
}
