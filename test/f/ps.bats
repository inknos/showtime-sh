#!/usr/bin/env bats

setup() {
    export BATS_LIB_PATH=${BATS_LIB_PATH:-"/usr/lib"}
    bats_load_library bats-support
    bats_load_library bats-assert

    load ../import_showtime.bash
}

@test "ps \"test\"" {
    run ps 'test'
    assert_success
    assert_output "${C_SUCCESS@E}${S_SUCCESS} test${NC@E}"
}

@test "DRYRUN=true ps \"test\"" {
    DRYRUN=true run ps 'test'
    assert_success
    assert_output "${C_SUCCESS@E}${S_SUCCESS} test${NC@E}"
}

@test "EXPORT_FORMAT=sh ps \"test\"" {
    EXPORT_FORMAT="sh" run ps 'test'
    assert_success
    assert_output "# test"
}

@test "EXPORT_FORMAT=md ps \"test\"" {
    EXPORT_FORMAT="md" run ps 'test'
    assert_success
    assert_output "test"
}

@test "QUIET=true ps \"test\"" {
    QUIET=true run ps 'test'
    assert_success
    assert_output ""
}
