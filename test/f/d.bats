#!/usr/bin/env bats

setup() {
    export BATS_LIB_PATH=${BATS_LIB_PATH:-"/usr/lib"}
    bats_load_library bats-support
    bats_load_library bats-assert

    load ../import_showtime.bash
}

@test "d \"test\"" {
    run d "test"
    assert_failure
    assert_output ""
}

@test "DEBUG=true d \"test\"" {
    DEBUG=true run d "test"
    assert_success
    assert_output "${C_DEBUG@E}${S_DEBUG}${NC@E} ${C_DEBUG_TEXT@E}test${NC@E}"
}

@test "DEBUG=true DRYRUN=true d \"test\"" {
    DEBUG=true DRYRUN=true run d "test"
    assert_success
    assert_output "${C_DEBUG@E}${S_DEBUG}${NC@E} ${C_DEBUG_TEXT@E}test${NC@E}"
}

@test "DEBUG=true QUIET=true d \"test\"" {
    DEBUG=true QUIET=true run d "test"
    assert_success
    assert_output "${C_DEBUG@E}${S_DEBUG}${NC@E} ${C_DEBUG_TEXT@E}test${NC@E}"
}

@test "DEBUG=true EXPORT_FORMAT='sh' S_DEBUG=\"!\" d \"test\"" {
    DEBUG=true EXPORT_FORMAT='sh' S_DEBUG="!" run d "test"
    assert_success
    assert_output "${C_DEBUG@E}!${NC@E} ${C_DEBUG_TEXT@E}test${NC@E}"
}

@test "DEBUG=true EXPORT_FORMAT='md' S_DEBUG=\"!\" d \"test\"" {
    DEBUG=true EXPORT_FORMAT='md' S_DEBUG="!" run d "test"
    assert_success
    assert_output "${C_DEBUG@E}!${NC@E} ${C_DEBUG_TEXT@E}test${NC@E}"
}
