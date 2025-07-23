#!/usr/bin/env bats

setup() {
    load ../test_helper/bats-support/load
    load ../test_helper/bats-assert/load
    load ../import_showtime.bash
}

@test "_print_header" {
    run _print_header "1" "Test Header"
    assert_success
    assert_output "${C_HEADER@E}========================================${NC@E}
${C_HEADER_TEXT@E}Test Header${NC@E}
${C_HEADER@E}========================================${NC@E}"
}

@test "DRYRUN=true _print_header" {
    DRYRUN=true run _print_header "1" "Test Header"
    assert_success
    assert_output "${C_HEADER@E}========================================${NC@E}
${C_HEADER_TEXT@E}Test Header${NC@E}
${C_HEADER@E}========================================${NC@E}"
}

@test "EXPORT_FORMAT='sh' _print_header" {
    EXPORT_FORMAT='sh' run _print_header "1" "Test Header"
    assert_success
    assert_output "# ========================================
#  Test Header
# ========================================"
}

@test "QUIET=true _print_header" {
    QUIET=true run _print_header "1" "Test Header"
    assert_success
    assert_output ""
}

@test "EXPORT_FORMAT=md _print_header" {
    EXPORT_FORMAT="md" run _print_header "1" "Test Header"
    assert_success
    assert_output "# Test Header"
}

@test "EXPORT_FORMAT=md _print_header 2" {
    EXPORT_FORMAT=md run _print_header "2" "Test Header"
    assert_success
    assert_output "## Test Header"
}

@test "EXPORT_FORMAT=md _print_header 3" {
    EXPORT_FORMAT=md run _print_header "3" "Test Header"
    assert_success
    assert_output "### Test Header"
}

@test "EXPORT_FORMAT=md _print_header 4" {
    EXPORT_FORMAT=md run _print_header "4" "Test Header"
    assert_success
    assert_output "#### Test Header"
}

@test "EXPORT_FORMAT=md _print_header 5" {
    EXPORT_FORMAT=md run _print_header "5" "Test Header"
    assert_success
    assert_output "##### Test Header"
}

@test "EXPORT_FORMAT=md _print_header 6" {
    EXPORT_FORMAT=md run _print_header "6" "Test Header"
    assert_success
    assert_output "###### Test Header"
}
