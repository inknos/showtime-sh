#!/usr/bin/env bats

setup() {
    load ../test_helper/bats-support/load
    load ../test_helper/bats-assert/load
    load ../import_showtime.bash
}

teardown() {
    rm -f test.txt
}

@test "e \"echo test\"" {
    run e "echo test"
    assert_success
    assert_output "${C_COMMAND@E}${S_COMMAND}${NC@E} ${C_COMMAND_TEXT@E}echo test${NC@E}
test"
}

@test "DEBUG=true e \"echo test\"" {
    DEBUG=true run e "echo test"
    assert_success
    assert_output "${C_COMMAND@E}${S_COMMAND}${NC@E} ${C_COMMAND_TEXT@E}echo test${NC@E}
test"
}

@test "DRYRUN=true e \"echo test\"" {
    DRYRUN=true run e "echo test"
    assert_success
    assert_output "${C_COMMAND@E}${S_COMMAND}${NC@E} ${C_COMMAND_TEXT@E}echo test${NC@E}"
}

# Ensure a command is not run in the background
@test "DRYRUN=true e \"echo test\ > test.txt" {
    DRYRUN=true run e "echo test > test.txt"
    assert_success
    assert_output "${C_COMMAND@E}${S_COMMAND}${NC@E} ${C_COMMAND_TEXT@E}echo test > test.txt${NC@E}"
    [[ ! -f "test.txt" ]]
}

# Ensure a command is not run in the background by checking the exit code
# is always 0
@test "DRYRUN=true e \"nonsense\"" {
    DRYRUN=true run e "nonsense"
    assert_success
    assert_output "${C_COMMAND@E}${S_COMMAND}${NC@E} ${C_COMMAND_TEXT@E}nonsense${NC@E}"
}

# Test EXPORT_FORMAT="sh"
@test "EXPORT_FORMAT=\"sh\" e \"echo test\"" {
    EXPORT_FORMAT="sh" run e "echo test"
    assert_success
    assert_output "echo test"
}

#Test EXPORT_FORMAT="md"
@test "EXPORT_FORMAT=\"md\" e \"echo test\"" {
    EXPORT_FORMAT="md" run e "echo test"
    assert_success
    assert_output "\`\`\`bash
echo test
\`\`\`"
}


# Ensure a command is not run when EXPORT is set
@test "EXPORT_FORMAT=\"sh\" e \"nonsense\"" {
    EXPORT_FORMAT="sh" run e "nonsense"
    assert_success
    assert_output "nonsense"
    [[ ! -f "test.txt" ]]
}

@test "QUIET=true e \"echo test\"" {
    QUIET=true run e "echo test"
    assert_success
    assert_output ""
}

# Ensure a command is run in the background even when QUIET is set
# by checking the output is redirected to a file
@test "QUIET=true e \"echo test\ > test.txt" {
    QUIET=true run e "echo test > test.txt"
    assert_success
    assert_output ""
    [[ -f "test.txt" ]]
    [[ "$(< test.txt)" = "test" ]]
}

# Ensure a command is run in the background even when QUIET is set
# by checking the exit code is 127
@test "QUIET=true e \"nonsense\"" {
    bats_require_minimum_version 1.5.0
    QUIET=true run -127 e "nonsense"
    assert_failure
    assert_output ""
}
