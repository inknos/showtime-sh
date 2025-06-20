#!/usr/bin/env bats

source showtime.sh

@test "p \"test\"" {
    result="$(p 'test')"
    [[ "$result" = *"${S_BULLET}"*"test"* ]]
}

@test "p \"Est corrupti eius... (>80char)\"" {
    result="$(p 'Est corrupti eius quia quia aut animi. Ea pariatur ut et culpa totam est. Voluptatem libero eos voluptates culpa')"
    [[ "$result" = *"${S_BULLET}"*"Est corrupti eius"*"eos voluptates culpa"* ]]
}

@test "DRYRUN=true p \"test\"" {
    result="$(DRYRUN=true p 'test')"
    [[ "$result" = *"${S_BULLET}"*"test"* ]]
}

@test "QUIET=true p \"test\"" {
    result="$(QUIET=true p 'test')"
    [[ "$result" = "" ]]
}
