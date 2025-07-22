#!/usr/bin/env bats

setup() {
    load ../import_showtime.bash
}

teardown() {
    rm -f test.txt
}

@test "ed \"echo test\"" {
    run ed "echo test"
    _=$(( status == 0 ))
    _=$(( ${#lines[@]} == 0 ))
}

@test "ed \"echo test\" > test.txt" {
    run ed "echo test > test.txt"
    _=$(( status == 0 ))
    _=$(( ${#lines[@]} == 0 ))
    [[ ! -f "test.txt" ]]
}

@test "DEBUG=true ed \"echo test\"" {
    DEBUG=true run ed "echo test"
    _=$(( status == 0 ))
    [[ "${lines[0]}" = "${C_DEBUG@E}${S_DEBUG}${NC@E} ${C_DEBUG_TEXT@E}echo test${NC@E}" ]]
    [[ "${lines[1]}" = "test" ]]

}

@test "DEBUG=true QUIET=true ed \"echo test\"" {
    DEBUG=true QUIET=true run ed "echo test"
    _=$(( status == 0 ))
    [[ "${lines[0]}" = "${C_DEBUG@E}${S_DEBUG}${NC@E} ${C_DEBUG_TEXT@E}echo test${NC@E}" ]]
    [[ "${lines[1]}" = "test" ]]
}
