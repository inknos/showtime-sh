#!/usr/bin/env bats

setup() {
    export BATS_LIB_PATH=${BATS_LIB_PATH:-"/usr/lib"}
    bats_load_library bats-support
    bats_load_library bats-assert

    load ../import_showtime.bash
}

teardown() {
    rm -f test.txt
}

@test "ed \"echo test\"" {
    run ed "echo test"
    assert_success
    assert_output ""
}

@test "ed \"echo test\" > test.txt" {
    run ed "echo test > test.txt"
    assert_success
    assert_output ""
    [[ ! -f "test.txt" ]]
}

@test "DEBUG=true ed \"echo test\"" {
    DEBUG=true run ed "echo test"
    assert_success
    assert_output "${C_DEBUG@E}${S_DEBUG}${NC@E} ${C_DEBUG_TEXT@E}echo test${NC@E}
test"
}

@test "DEBUG=true QUIET=true ed \"echo test\"" {
    DEBUG=true QUIET=true run ed "echo test"
    assert_success
    assert_output "${C_DEBUG@E}${S_DEBUG}${NC@E} ${C_DEBUG_TEXT@E}echo test${NC@E}
test"
}
