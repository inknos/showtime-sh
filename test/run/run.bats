#!/usr/bin/env bats

setup() {
    export BATS_LIB_PATH=${BATS_LIB_PATH:-"/usr/lib"}
    bats_load_library bats-support
    bats_load_library bats-assert

    load ../import_showtime.bash
}

@test "./show" {
    run ./show
    assert_failure
    assert_output --partial "Usage"
}

@test "./show --help" {
    run ./show --help
    assert_failure
    assert_output --partial "Usage"
}

@test "./show --clean only" {
    run ./show --clean
    assert_failure
    assert_output --partial "Please"
}

@test "./show --clean --offline" {
    run ./show --clean --offline
    assert_failure
    assert_line --index 0 "${C_ERROR@E}${S_ERROR} --clean and --offline can't be set together${NC@E}"
    assert_line --index 1 "Usage: ./show <demo_name> [--clean|-y]"
}

@test "./show --clean not found" {
    run ./show --clean test/run/demo
    assert_failure
    assert_line --index 0 "${C_WARNING@E}${S_WARNING} Clean script 'test/run/demo/clean.sh' not found${NC@E}"
}

@test "./show --offline not found" {
    run ./show --offline test/run/demo
    assert_failure
    assert_line --index 0 "${C_WARNING@E}${S_WARNING} Offline script 'test/run/demo/offline.sh' not found${NC@E}"
}

@test "./show full" {
    run ./show test/run/full
    assert_success
    assert_output "${C_BULLET@E}${S_BULLET}${NC@E} ${C_TEXT@E}demo${NC@E}

${C_COMMAND@E}${S_COMMAND}${NC@E} ${C_COMMAND_TEXT@E}echo \"test\"${NC@E}
test"
}

@test "./show --clean foo" {
    run ./show --clean test/run/full
    assert_success
    assert_output "${C_BULLET@E}${S_BULLET}${NC@E} ${C_TEXT@E}clean${NC@E}"
}

@test "./show --offline foo" {
    run ./show --offline test/run/full
    assert_success
    assert_output "${C_BULLET@E}${S_BULLET}${NC@E} ${C_TEXT@E}offline${NC@E}"
}

@test "./show theme" {
    run ./show test/run/theme
    assert_success
    assert_output "${C_BULLET@E}>${NC@E} ${C_TEXT@E}demo${NC@E}"
}

@test "./show --export sh" {
    run ./show --export sh test/run/full
    assert_success
    assert_output "#!/bin/bash

# demo

echo \"test\""
}

@test "./show --export md" {
    run ./show --export md test/run/full
    assert_success
    assert_output "demo

\`\`\`bash
echo \"test\"
\`\`\`"
}

@test "./show --export md --clean" {
    run ./show --export md --clean test/run/full
    assert_success
    assert_output "clean"
}

@test "./show --export invalid" {
    run ./show --export invalid test/run/full
    assert_failure
    assert_line --index 0 "${C_ERROR@E}${S_ERROR} --export takes 'sh' or 'md', got: 'invalid'${NC@E}"
    assert_line --index 1 "Usage: ./show <demo_name> [--clean|-y]"
}

@test "./show --export md --offline" {
    run ./show --export md --offline test/run/full
    assert_success
    assert_output "offline"
}

@test "./show --export md --quiet" {
    run ./show --export md --quiet test/run/full
    assert_failure
    assert_line --index 0 "${C_ERROR@E}${S_ERROR} --export can't be set with --quiet or --dryrun${NC@E}"
    assert_line --index 1 "Usage: ./show <demo_name> [--clean|-y]"
}

# Test how b behaves with --dryrun, --quiet, -y
@test "./show --dryrun bash" {
    run ./show --dryrun test/run/bash
    assert_success
    assert_output "${C_BULLET@E}${S_BULLET}${NC@E} ${C_TEXT@E}bash${NC@E}"
}

@test "./show --quiet bash" {
    run ./show --quiet test/run/bash
    assert_success
    assert_output ""
}

@test "./show -y bash" {
    run ./show -y test/run/bash
    assert_success
    assert_output "${C_BULLET@E}${S_BULLET}${NC@E} ${C_TEXT@E}bash${NC@E}"
}

# Test how w behaves with --dryrun, --quiet, -y
@test "./show --dryrun wait_timeout" {
    run ./show --dryrun test/run/wait_timeout
    assert_success
    assert_output "${C_BULLET@E}${S_BULLET}${NC@E} ${C_TEXT@E}wait_timeout${NC@E}

${C_PROMPT@E}Press Enter to continue...${NC@E}
${C_BULLET@E}${S_BULLET}${NC@E} ${C_TEXT@E}done${NC@E}"
}

@test "./show --quiet wait_timeout" {
    run ./show --quiet test/run/wait_timeout
    assert_success
    assert_output ""
}

@test "./show -y wait" {
    run ./show -y test/run/wait
    assert_success
    assert_output "${C_BULLET@E}${S_BULLET}${NC@E} ${C_TEXT@E}wait${NC@E}

${C_BULLET@E}${S_BULLET}${NC@E} ${C_TEXT@E}done${NC@E}"
}

@test "./show -y --quiet wait" {
    run ./show -y --quiet test/run/wait
    assert_success
    assert_output ""
}

@test "./show -y wait_timeout" {
    run ./show -y test/run/wait_timeout
    assert_success
    assert_output "${C_BULLET@E}${S_BULLET}${NC@E} ${C_TEXT@E}wait_timeout${NC@E}

${C_BULLET@E}${S_BULLET}${NC@E} ${C_TEXT@E}done${NC@E}"
}

@test "./show -y --quiet wait_timeout" {
    run ./show -y --quiet test/run/wait_timeout
    assert_success
    assert_output ""
}

# check that commands exec with e are added to the temp history
@test "./show history" {
    run ./show test/run/history
    assert_success
    assert_line --index 5 "echo e"
    assert_line --index 6 "echo et"
    assert_line --index 7 --regexp '^cat\ \/tmp\/tmp\.[0-9a-zA-Z]{4,}$'
}

# check debug is added to history
@test "DEBUG=true ./show history" {
    DEBUG=true run ./show test/run/history
    assert_success
    assert_line --index 7 "echo e"
    assert_line --index 8 "echo et"
    assert_line --index 9 "echo ed"
    assert_line --index 10 --regexp '^cat\ \/tmp\/tmp\.[0-9a-zA-Z]{4,}$'
}
