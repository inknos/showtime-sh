#!/usr/bin/env bats

source showtime.sh

@test "DEBUG=true d \"test\"" {
    result="$(d 'test')"
    [[ "$result" = *"test"* ]]
}

@test "DEBUG=true DRYRUN=true d \"test\"" {
    result="$(DRYRUN=true d 'test')"
    [[ "$result" = *"test"* ]]
}

@test "DEBUG=true QUIET=true d \"test\"" {
    result="$(QUIET=true d 'test')"
    [[ "$result" = "" ]]
}

@test "DEBUG=true DRYRUN=true QUIET=true d \"test\"" {
    result="$(QUIET=true DRYRUN=true d 'test')"
    [[ "$result" = "" ]]
}

# DEBUG=false

@test "DEBUG=false d \"test\"" {
    result="$(DEBUG=false d 'test')"
    [[ "$result" = "" ]]
}

@test "DEBUG=false DRYRUN=true d \"test\"" {
    result="$(DEBUG=false DRYRUN=true d 'test')"
    [[ "$result" = "" ]]
}

@test "DEBUG=false QUIET=true d \"test\"" {
    result="$(QUIET=true d 'test')"
    [[ "$result" = "" ]]
}
