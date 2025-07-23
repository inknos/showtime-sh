#!/usr/bin/env bats

setup() {
    load ../test_helper/bats-support/load
    load ../test_helper/bats-assert/load
    load ../import_showtime.bash
}

teardown() {
    rm -f test.txt
}

@test "et \"sleep 100\" .1" {
    run et "sleep 100" .1
    assert_success
    assert_output "${C_COMMAND@E}${S_COMMAND}${NC@E} ${C_COMMAND_TEXT@E}sleep 100${NC@E}

${C_WARNING@E}${S_WARNING} Command timed out after .1 seconds${NC@E}"
}

@test "QUIET=true et \"sleep 100\" .1" {
    QUIET=true run et "sleep 100" .1
    assert_success
    assert_output ""
}

@test "DRYRUN=true et \"sleep 100\" .1" {
    DRYRUN=true run et "sleep 100" .1
    assert_success
    assert_output "${C_COMMAND@E}${S_COMMAND}${NC@E} ${C_COMMAND_TEXT@E}sleep 100${NC@E}"
}

@test "EXPORT_FORMAT=sh et \"sleep 100\" .1" {
    EXPORT_FORMAT="sh" run et "sleep 100" .1
    assert_success
    assert_output "sleep 100"
}

@test "EXPORT_FORMAT=md et \"sleep 100\" .1" {
    EXPORT_FORMAT="md" run et "sleep 100" .1
    assert_success
    assert_output "\`\`\`bash
sleep 100
\`\`\`"
}
