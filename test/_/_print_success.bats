#!/usr/bin/env bats

setup() {
    load ../import_showtime.bash
}

@test "_print_success" {
    run _print_success 'test success'
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = *"test success"* ]]
    [[ "${lines[0]}" = *"${S_SUCCESS}"* ]]
}

@test "_print_success with custom symbol" {
    S_SUCCESS="S:" run _print_success 'test success'
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = *"test success"* ]]
    [[ "${lines[0]}" = *"S:"* ]]
}

@test "DRY_RUN=true _print_success" {
    DRY_RUN=true run _print_success 'test success'
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = *"test success"* ]]
    [[ "${lines[0]}" = *"${S_SUCCESS}"* ]]
}

@test "DRY_RUN=true _print_success with custom symbol" {
    DRY_RUN=true S_SUCCESS="S:" run _print_success 'test success'
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = *"test success"* ]]
    [[ "${lines[0]}" = *"S:"* ]]
}

@test "EXPORT=true _print_success" {
    EXPORT=true run _print_success 'test success'
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = "# test success" ]]
}

@test "EXPORT=true _print_success with custom symbol changes nothing" {
    EXPORT=true S_SUCCESS="S:" run _print_success 'test success'
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = "# test success" ]]
}

@test "QUIET=true _print_success" {
    QUIET=true run _print_success 'test success'
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = "" ]]
} 