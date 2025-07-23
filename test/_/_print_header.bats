#!/usr/bin/env bats

setup() {
    export BATS_LIB_PATH=${BATS_LIB_PATH:-"/usr/lib"}
    bats_load_library bats-support
    bats_load_library bats-assert

    load ../import_showtime.bash
}

@test "_print_header" {
    run _print_header "1" "Test Header"
    assert_success
    assert_output "${C_HEADER@E}$(printf '=%.0s' {1..13})${NC@E}
 ${C_HEADER_TEXT@E}Test Header${NC@E}
${C_HEADER@E}$(printf '=%.0s' {1..13})${NC@E}"
}

@test "DRYRUN=true _print_header" {
    DRYRUN=true run _print_header "1" "Test Header"
    assert_success
    assert_output "${C_HEADER@E}$(printf '=%.0s' {1..13})${NC@E}
 ${C_HEADER_TEXT@E}Test Header${NC@E}
${C_HEADER@E}$(printf '=%.0s' {1..13})${NC@E}"
}

@test "_print_header (>80 char)" {
    run _print_header "1" "Est quo ipsa est. Adipisci et sit iusto voluptatibus voluptatem autem non. Et est unde eum ipsum est a sit et. Voluptate dolorem ut qui nam sint ratione expedita aspernatur."
    assert_success
    assert_output "${C_HEADER@E}$(printf '=%.0s' {1..80})${NC@E}
${C_HEADER_TEXT@E}Est quo ipsa est. Adipisci et sit iusto voluptatibus voluptatem autem non. Et${NC@E}
${C_HEADER_TEXT@E}est unde eum ipsum est a sit et. Voluptate dolorem ut qui nam sint ratione${NC@E}
${C_HEADER_TEXT@E}expedita aspernatur.${NC@E}
${C_HEADER@E}$(printf '=%.0s' {1..80})${NC@E}"
}

@test "EXPORT_FORMAT='sh' _print_header" {
    EXPORT_FORMAT='sh' run _print_header "1" "Test Header"
    assert_success
    assert_output "# $(printf '=%.0s' {1..80})
# Test Header
# $(printf '=%.0s' {1..80})"
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
