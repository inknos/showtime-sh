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

@test "pi \"test\"" {
    result="$(pi 'test')"
    [[ "$result" = *"${S_INFO}"*"INF: test"* ]]
}

@test "DRYRUN=true pi \"test\"" {
    result="$(DRYRUN=true pi 'test')"
    [[ "$result" = *"${S_INFO}"*"INF: test"* ]]
}

@test "QUIET=true pi \"test\"" {
    result="$(QUIET=true pi 'test')"
    [[ "$result" = "" ]]
}

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