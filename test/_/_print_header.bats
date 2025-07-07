#!/usr/bin/env bats

setup() {
    load ../import_showtime.bash
}

@test "_print_header" {
    run _print_header "1" "Test Header"
    _=$(( status == 0 ))
    [[ "${lines[0]}" = "${C_HEADER@E}========================================${NC@E}" ]]
    [[ "${lines[1]}" = "${C_HEADER_TEXT@E}Test Header${NC@E}" ]]
    [[ "${lines[2]}" = "${C_HEADER@E}========================================${NC@E}" ]]
    [[ "${lines[3]}" = "" ]]
}

@test "DRYRUN=true _print_header" {
    DRYRUN=true run _print_header "1" "Test Header"
    _=$(( status == 0 ))
    [[ "${lines[0]}" = "${C_HEADER@E}========================================${NC@E}" ]]
    [[ "${lines[1]}" = "${C_HEADER_TEXT@E}Test Header${NC@E}" ]]
    [[ "${lines[2]}" = "${C_HEADER@E}========================================${NC@E}" ]]
    [[ "${lines[3]}" = "" ]]
}

@test "EXPORT=true _print_header" {
    EXPORT=true run _print_header "1" "Test Header"
    _=$(( status == 0 ))
    [[ "${lines[0]}" = "# ========================================" ]]
    [[ "${lines[1]}" = "#  Test Header" ]]
    [[ "${lines[2]}" = "# ========================================" ]]
    [[ "${lines[3]}" = "" ]]
}

@test "QUIET=true _print_header" {
    QUIET=true run _print_header "1" "Test Header"
    _=$(( status == 0 ))
    [[ "${lines[0]}" = "" ]]
}

@test "EXPORT_FORMAT=md _print_header" {
    EXPORT_FORMAT="md" run _print_header "1" "Test Header"
    _=$(( status == 0 ))
    [[ "${lines[0]}" = "# Test Header" ]]
    [[ "${lines[1]}" = "" ]]
}

@test "EXPORT_FORMAT=md _print_header 2" {
    EXPORT_FORMAT=md run _print_header "2" "Test Header"
    _=$(( status == 0 ))
    [[ "${lines[0]}" = "## Test Header" ]]
    [[ "${lines[1]}" = "" ]]
}
