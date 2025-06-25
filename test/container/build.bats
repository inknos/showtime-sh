#!/usr/bin/env bats

teardown() {
    podman rmi -f showtime-bats
}

@test "build container" {
    run podman build -t showtime-bats .
    [ "$status" -eq 0 ]
}