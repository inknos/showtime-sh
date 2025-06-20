#!/usr/bin/env bats

source showtime.sh

@test "e \"test\"" {
    result="$(e 'echo test')"
    [[ "$result" == *"echo test"*"test" ]]
}

@test "DRYRUN=true e \"test\"" {
    result="$(DRYRUN=true e 'echo test')"
    [[ "$result" == *"echo test"*"test" ]]
}

@test "QUIET=true e \"test\"" {
    result="$(QUIET=true e 'echo test')"
    [[ "$result" == "test" ]]
}

@test "et \"test\" 0" {
    result="$(et 'echo test' 0)"
    [[ "$result" == *"echo test"*"test" ]]
}

@test "DRYRUN=true et \"test\" 0" {
    result="$(DRYRUN=true et 'echo test' 0)"
    [[ "$result" == *"echo test"*"test" ]]
}

@test "QUIET=true et \"test\" 0" {
    result="$(QUIET=true et 'echo test' 0)"
    [[ "$result" == "test" ]]
}