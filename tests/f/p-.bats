#!/usr/bin/env bats

source showtime.sh


@test "p-" {
    result="$(p-)"
    [[ "$result" = *"----------------------------------------"* ]]
}

@test "DRYRUN=true p-" {
    result="$(DRYRUN=true p-)"
    [[ "$result" = *"----------------------------------------"* ]]
}

@test "QUIET=true p-" {
    result="$(QUIET=true p-)"
    [[ "$result" = "" ]]
}

