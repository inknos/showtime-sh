#!/usr/bin/env bats

setup() {
    export BATS_LIB_PATH=${BATS_LIB_PATH:-"/usr/lib"}
    bats_load_library bats-support
    bats_load_library bats-assert

    load ../import_showtime.bash
}

@test "p \"test\"" {
    run p "test"
    assert_success
    assert_output "${C_BULLET@E}${S_BULLET}${NC@E} ${C_TEXT@E}test${NC@E}"
}

@test "p \"Est corrupti eius... (>80char)\"" {
    run p "Est corrupti eius quia quia aut animi. Ea pariatur ut et culpa totam est. Voluptatem libero eos voluptates culpa"
    assert_success
    assert_output "${C_BULLET@E}${S_BULLET}${NC@E} ${C_TEXT@E}Est corrupti eius quia quia aut animi. Ea pariatur ut et culpa totam est.${NC@E}
  ${C_TEXT@E}Voluptatem libero eos voluptates culpa${NC@E}"
}

@test "p \"do not strip     spaces\"" {
    run p "do not strip     spaces"
    assert_success
    assert_output "${C_BULLET@E}${S_BULLET}${NC@E} ${C_TEXT@E}do not strip     spaces${NC@E}"
}

@test "DRYRUN=true p \"test\"" {
    DRYRUN=true run p "test"
    assert_success
    assert_output "${C_BULLET@E}${S_BULLET}${NC@E} ${C_TEXT@E}test${NC@E}"
}

@test "EXPORT_FORMAT=sh p \"test\"" {
    EXPORT_FORMAT="sh" run p "test"
    assert_success
    assert_output "# test"
}

@test "EXPORT_FORMAT=sh p \"Est corrupti eius... (>80char)\"" {
    EXPORT_FORMAT="sh" run p "Est corrupti eius quia quia aut animi. Ea pariatur ut et culpa totam est. Voluptatem libero eos voluptates culpa"
    assert_success
    assert_output "# Est corrupti eius quia quia aut animi. Ea pariatur ut et culpa totam est.
# Voluptatem libero eos voluptates culpa"
}

@test "EXPORT_FORMAT=md p \"test\"" {
    EXPORT_FORMAT="md" run p "test"
    assert_success
    assert_output "test"
}


@test "EXPORT_FORMAT=md p \"Est corrupti eius... (>80char)\"" {
    EXPORT_FORMAT="md" run p "Est corrupti eius quia quia aut animi. Ea pariatur ut et culpa totam est. Voluptatem libero eos voluptates culpa"
    assert_success
    assert_output "Est corrupti eius quia quia aut animi. Ea pariatur ut et culpa totam est.
Voluptatem libero eos voluptates culpa"
}


@test "QUIET=true p \"test\"" {
    QUIET=true run p "test"
    assert_success
    assert_output ""
}
