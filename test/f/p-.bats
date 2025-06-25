#!/usr/bin/env bats

setup() {
    if [ $(basename $(pwd)) = "f" ]; then
        source ../../showtime.sh
    else
        source showtime.sh
    fi
}

@test "p-" {
    result="$(p-)"
    [[ "$result" = *"----------------------------------------"* ]]
}

@test "DRYRUN=true p-" {
    result="$(DRYRUN=true p-)"
    [[ "$result" = *"----------------------------------------"* ]]
}

@test "EXPORT=true p-" {
    EXPORT=true run p-
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = "# ----------------------------------------" ]]
}

@test "QUIET=true p-" {
    result="$(QUIET=true p-)"
    [[ "$result" = "" ]]
}

