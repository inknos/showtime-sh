#!/usr/bin/env bats

setup() {
    export BATS_LIB_PATH=${BATS_LIB_PATH:-"/usr/lib"}
    bats_load_library bats-support
    bats_load_library bats-assert

    load ../import_showtime.bash
}

@test "pi \"test\"" {
    run pi 'test'
    assert_success
    assert_output "${C_INFO@E}${S_INFO} test${NC@E}"
}

@test "DRYRUN=true pi \"test\"" {
    DRYRUN=true run pi 'test'
    assert_success
    assert_output "${C_INFO@E}${S_INFO} test${NC@E}"
}

@test "EXPORT_FORMAT=sh pi \"test\"" {
    EXPORT_FORMAT="sh" run pi 'test'
    assert_success
    assert_output "# INF: test"
}

@test "EXPORT_FORMAT=md pi \"test\"" {
    EXPORT_FORMAT="md" run pi 'test'
    assert_success
    assert_output "INF: test"
}

@test "QUIET=true pi \"test\"" {
    QUIET=true run pi 'test'
    assert_success
    assert_output ""
}
