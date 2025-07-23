#!/usr/bin/env bats

setup() {
    export BATS_LIB_PATH=${BATS_LIB_PATH:-"/usr/lib"}
    bats_load_library bats-support
    bats_load_library bats-assert

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
