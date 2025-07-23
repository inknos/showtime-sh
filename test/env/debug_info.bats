#!/usr/bin/env bats

setup() {
    export BATS_LIB_PATH=${BATS_LIB_PATH:-"/usr/lib"}
    bats_load_library bats-support
    bats_load_library bats-assert

    load ../import_showtime.bash
}

@test "_debug_info" {
    run _debug_info
    assert_failure
    assert_output --partial "DEBUG:"
    assert_output --partial "DRYRUN:"
    assert_output --partial "EXPORT_FORMAT:"
    assert_output --partial "QUIET:"
}

@test "_debug_info with QUIET=true" {
    QUIET=true run _debug_info
    assert_failure
    assert_output --partial "DEBUG:"
    assert_output --partial "DRYRUN:"
    assert_output --partial "EXPORT_FORMAT:"
    assert_output --partial "QUIET: true"
}

@test "_debug_info with DRYRUN=true" {
    DRYRUN=true run _debug_info
    assert_failure
    assert_output --partial "DEBUG:"
    assert_output --partial "DRYRUN: true"
    assert_output --partial "EXPORT_FORMAT:"
    assert_output --partial "QUIET:"
}

@test "_debug_info with EXPORT_FORMAT='sh'" {
    EXPORT_FORMAT='sh' run _debug_info
    assert_failure
    assert_output --partial "DEBUG:"
    assert_output --partial "DRYRUN:"
    assert_output --partial "EXPORT_FORMAT: sh"
    assert_output --partial "QUIET:"
}

@test "_debug_info with DEBUG=true" {
    DEBUG=true run _debug_info
    assert_failure
    assert_output --partial "DEBUG: true"
    assert_output --partial "DRYRUN:"
    assert_output --partial "EXPORT_FORMAT:"
    assert_output --partial "QUIET:"
}

@test "_debug_info with EXPORT_FORMAT='md'" {
    EXPORT_FORMAT='md' run _debug_info
    assert_failure
    assert_output --partial "DEBUG:"
    assert_output --partial "DRYRUN:"
    assert_output --partial "EXPORT_FORMAT: md"
    assert_output --partial "QUIET:"
}

@test "_debug_info with all set to true" {
    QUIET=true DEBUG=true DRYRUN=true EXPORT_FORMAT='sh' run _debug_info
    assert_failure
    assert_output --partial "DEBUG: true"
    assert_output --partial "DRYRUN: true"
    assert_output --partial "EXPORT_FORMAT: sh"
    assert_output --partial "QUIET: true"
}
