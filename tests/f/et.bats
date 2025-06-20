#!/usr/bin/env bats

source showtime.sh

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
