#!/usr/bin/env bats

setup() {
    load ../test_helper/bats-support/load
    load ../test_helper/bats-assert/load
    load ../import_showtime.bash
}

@test "p-" {
    run p-
    assert_success
    assert_output "${C_SEPARATOR@E}----------------------------------------${NC@E}"
}

@test "DRYRUN=true p-" {
    DRYRUN=true run p-
    assert_success
    assert_output "${C_SEPARATOR@E}----------------------------------------${NC@E}"
}

@test "EXPORT_FORMAT=sh p-" {
    EXPORT_FORMAT="sh" run p-
    assert_success
    assert_output "# ----------------------------------------"
}

@test "EXPORT_FORMAT=md p-" {
    EXPORT_FORMAT="md" run p-
    assert_success
    assert_output "---"
}

@test "QUIET=true p-" {
    QUIET=true run p-
    assert_success
    assert_output ""
}
