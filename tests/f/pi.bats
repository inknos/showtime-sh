#!/usr/bin/env bats

source showtime.sh


@test "pi \"test\"" {
    result="$(pi 'test')"
    [[ "$result" = *"${s_info}"*"inf: test"* ]]
}

@test "DRYRUN=true pi \"test\"" {
    result="$(DRYRUN=true pi 'test')"
    [[ "$result" = *"${S_INFO}"*"INF: test"* ]]
}

@test "QUIET=true pi \"test\"" {
    result="$(QUIET=true pi 'test')"
    [[ "$result" = "" ]]
}
