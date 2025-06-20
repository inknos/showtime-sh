#!/usr/bin/env bats

source showtime.sh


@test "pw \"test\"" {
    result="$(pw 'test')"
    [[ "$result" = *"${S_WARNING}"*"WRN: test"* ]]
}

@test "DRYRUN=true pw \"test\"" {
    result="$(DRYRUN=true pw 'test')"
    [[ "$result" = *"${S_WARNING}"*"WRN: test"* ]]
}

@test "QUIET=true pw \"test\"" {
    result="$(QUIET=true pw 'test')"
    [[ "$result" = "" ]]
}
