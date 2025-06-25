#!/usr/bin/env bats

source ../../showtime.sh

@test "_print_header" {
    run _print_header 'Test Header'
    [ "$status" -eq 0 ]
    [[ "${lines[1]}" == *"Test Header"* ]]
    [[ "${lines[0]}" == *"========"* ]]
} 