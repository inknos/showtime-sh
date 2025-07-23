#!/usr/bin/env bats

setup() {
    export BATS_LIB_PATH=${BATS_LIB_PATH:-"/usr/lib"}
    bats_load_library bats-support
    bats_load_library bats-assert
}

teardown_file() {
    podman rmi -f showtime-bats || true
}

@test "build container" {
    skip
    run podman build -t showtime-bats --quiet .
    assert_success
    assert_output --regexp "[0-9a-z]{64}"
}

@test "run container" {
    skip
    bats_require_minimum_version 1.5.0
    run -1 podman run --rm -it showtime-bats
    assert_failure
    assert_output --partial "Usage:"
}
