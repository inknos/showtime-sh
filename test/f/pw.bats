#!/usr/bin/env bats

setup() {
    export BATS_LIB_PATH=${BATS_LIB_PATH:-"/usr/lib"}
    bats_load_library bats-support
    bats_load_library bats-assert

    load ../import_showtime.bash
}

@test "pw \"test\"" {
    run pw 'test'
    assert_success
    assert_output "${C_WARNING@E}${S_WARNING} test${NC@E}"
}

@test "DRYRUN=true pw \"test\"" {
    DRYRUN=true run pw 'test'
    assert_success
    assert_output "${C_WARNING@E}${S_WARNING} test${NC@E}"
}

@test "EXPORT_FORMAT=sh pw \"test\"" {
    EXPORT_FORMAT="sh" run pw 'test'
    assert_success
    assert_output "# WRN: test"
}

@test "EXPORT_FORMAT=md pw \"test\"" {
    EXPORT_FORMAT="md" run pw 'test'
    assert_success
    assert_output "WRN: test"
}

@test "QUIET=true pw \"test\"" {
    QUIET=true run pw 'test'
    assert_success
    assert_output ""
}
