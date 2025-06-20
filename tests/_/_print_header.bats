#!/usr/bin/env bats

source ../showtime.sh

@test "test _print_header()" {
    result="$(_print_header 'Test Header')"
    [[ "$result" == *"Test Header"* ]]
    [[ "$result" == *"========"* ]]
} 