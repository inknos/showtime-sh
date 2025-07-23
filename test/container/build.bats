#!/usr/bin/env bats

setup() {
    load ../test_helper/bats-support/load
    load ../test_helper/bats-assert/load
}

teardown_file() {
    podman rmi -f showtime-bats
}

@test "build container" {
    run podman build -t showtime-bats --quiet .
    assert_success
    assert_output --regexp "[0-9a-z]{64}"
}

@test "run container" {
    bats_require_minimum_version 1.5.0
    run -1 podman run --rm -it showtime-bats
    assert_failure
    assert_output --partial "Usage:"
}
