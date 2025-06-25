#!/usr/bin/env bats

setup() {
    load ../import_showtime.bash
}

@test "_print_header" {
    run _print_header 'Test Header'
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" == *"========"* ]]
    [[ "${lines[1]}" == *"Test Header"* ]]
    [[ "${lines[2]}" == *"========"* ]]
    [[ "${lines[3]}" == "" ]]
}

@test "DRYRUN=true _print_header" {
    DRYRUN=true run _print_header 'Test Header'
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" == *"========"* ]]
    [[ "${lines[1]}" == *"Test Header"* ]]
    [[ "${lines[2]}" == *"========"* ]]
    [[ "${lines[3]}" == "" ]]
} 

@test "EXPORT=true _print_header" {
    EXPORT=true run _print_header 'Test Header'
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" == "# ========================================" ]]
    [[ "${lines[1]}" == "#  Test Header"* ]]
    [[ "${lines[2]}" == "# ========================================" ]]
    [[ "${lines[3]}" == "" ]]
}

@test "QUIET=true _print_header" {
    QUIET=true run _print_header 'Test Header'
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" == "" ]]
}