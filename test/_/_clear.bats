#!/usr/bin/env bats

setup() {
    load ../import_showtime.bash
}

@test "_clear" {
    # Since _clear() calls the clear command, we can only test it doesn't error
    run _clear
    _=$(( status == 0 ))
}

@test "DRYRUN=true _clear" {
    DRYRUN=true run _clear
    _=$(( status == 0 ))
}

@test "QUIET=true _clear" {
    QUIET=true run _clear
    _=$(( status == 0 ))
}

@test "EXPORT=true _clear" {
    EXPORT=true run _clear
    _=$(( status == 0 ))
}
