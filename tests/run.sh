#!/usr/bin/env bats

source showtime.sh

@test "./run examples/minimal --export" {
    result="$(./run examples/minimal --export | wc -l)"
    [ "$result" -eq 33 ]
}
