#! /usr/bin/env bats

setup() {
    load ../import_showtime.bash
}

@test "w with timeout" {
    bats_require_minimum_version 1.5.0
    run -142 w 0.1
    [[ "$status" -eq 142 ]]
    [[ "${lines[0]}" = *"Press Enter to continue..."* ]]
}

@test "w with timeout and GOON=true" {
    bats_require_minimum_version 1.5.0
    GOON=true run w 0.1
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = "" ]]
}

# Verify that w will actually wait for timeout by seeing the error code
@test "w with timeout and QUIET=true" {
    bats_require_minimum_version 1.5.0
    QUIET=true run w 0.1
    [[ "$status" -eq 142 ]]
}