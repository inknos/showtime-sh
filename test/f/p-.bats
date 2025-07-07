#!/usr/bin/env bats

setup() {
    load ../import_showtime.bash
}

@test "p-" {
    result="$(p-)"
    [[ "$result" = "${C_SEPARATOR@E}----------------------------------------${NC@E}" ]]
}

@test "DRYRUN=true p-" {
    result="$(DRYRUN=true p-)"
    [[ "$result" = *"----------------------------------------"* ]]
}

@test "EXPORT=true p-" {
    EXPORT=true run p-
    (( status == 0 ))
    [[ "${lines[0]}" = "# ----------------------------------------" ]]
}

@test "QUIET=true p-" {
    result="$(QUIET=true p-)"
    [[ "$result" = "" ]]
}

