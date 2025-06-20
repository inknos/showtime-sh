#!/usr/bin/env bats

source showtime.sh


@test "ps \"test\"" {
    result="$(ps 'test')"
    [[ "$result" = *"${S_SUCCESS}"*"test"* ]]
}

@test "DRYRUN=true ps \"test\"" {
    result="$(DRYRUN=true ps 'test')"
    [[ "$result" = *"${S_SUCCESS}"*"test"* ]]
}

@test "QUIET=true ps \"test\"" {
    result="$(QUIET=true ps 'test')"
    [[ "$result" = "" ]]
}

