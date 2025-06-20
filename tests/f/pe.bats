#!/usr/bin/env bats

source showtime.sh


@test "pe \"test\"" {
    result="$(pe 'test')"
    [[ "$result" = *"${S_ERROR}"*"ERR: test"* ]]
}

@test "DRYRUN=true pe \"test\"" {
    result="$(DRYRUN=true pe 'test')"
    [[ "$result" = *"${S_ERROR}"*"ERR: test"* ]]
}

@test "QUIET=true pe \"test\"" {
    result="$(QUIET=true pe 'test')"
    [[ "$result" = "" ]]
}
