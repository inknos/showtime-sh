#!/usr/bin/env bats

setup() {
    load ../import_showtime.bash
}

@test "./show" {
    run ./show
    [ "$status" -eq 1 ]
    [[ "$lines[0]" = "Usage"* ]]
}
