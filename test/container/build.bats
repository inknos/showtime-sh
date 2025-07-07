#!/usr/bin/env bats

teardown_file() {
    podman rmi -f showtime-bats
}

@test "build container" {
    run podman build -t showtime-bats --quiet .
    _=$(( status == 0 ))
    _=$(( ${#lines[@]} == 1 ))
}

@test "run container" {
    bats_require_minimum_version 1.5.0
    run -1 podman run --rm -it showtime-bats
    _=$(( status == 1 ))
    [[ "${lines[0]}" = "Usage:"* ]]
}
