#!/usr/bin/env bats

setup() {
    export BATS_LIB_PATH=${BATS_LIB_PATH:-"/usr/lib"}
    bats_load_library bats-support
    bats_load_library bats-assert

    load ../import_showtime.bash
}

@test "test _print_command()" {
    run _print_command 'echo test'
    assert_success
    assert_output "${C_COMMAND@E}${S_COMMAND}${NC@E} ${C_COMMAND_TEXT@E}echo test${NC@E}"
}

@test "test _print_command() with QUIET=true" {
    QUIET=true run _print_command 'echo test'
    assert_success
    assert_output ""
}

@test "test _print_command() with DRYRUN=true" {
    DRYRUN=true run _print_command 'echo test'
    assert_success
    assert_output "${C_COMMAND@E}${S_COMMAND}${NC@E} ${C_COMMAND_TEXT@E}echo test${NC@E}"
}

@test "test _print_command() with EXPORT_FORMAT='sh'" {
    EXPORT_FORMAT='sh' run _print_command 'echo test'
    assert_success
    assert_output "echo test"
}
