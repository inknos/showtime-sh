#!/usr/bin/env bats

setup() {
    load ../import_showtime.bash
}

@test "p \"test\"" {
    run p "test"
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = "${C_BULLET@E}${S_BULLET}${NC@E} ${C_TEXT@E}test${NC@E}" ]]
}

@test "p \"Est corrupti eius... (>80char)\"" {
    run p "Est corrupti eius quia quia aut animi. Ea pariatur ut et culpa totam est. Voluptatem libero eos voluptates culpa"
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = "${C_BULLET@E}${S_BULLET}${NC@E} ${C_TEXT@E}Est corrupti eius quia quia aut animi. Ea pariatur ut et culpa totam est.${NC@E}" ]]
    [[ "${lines[1]}" = "  ${C_TEXT@E}Voluptatem libero eos voluptates culpa${NC@E}" ]]
}

@test "DRYRUN=true p \"test\"" {
    DRYRUN=true run p "test"
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = "${C_BULLET@E}${S_BULLET}${NC@E} ${C_TEXT@E}test${NC@E}" ]]
}

@test "EXPORT=true p \"test\"" {
    EXPORT=true run p "test"
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = "# test" ]]
}

@test "EXPORT=true p \"Est corrupti eius... (>80char)\"" {
    EXPORT=true run p "Est corrupti eius quia quia aut animi. Ea pariatur ut et culpa totam est. Voluptatem libero eos voluptates culpa"
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = "# Est corrupti eius quia quia aut animi. Ea pariatur ut et culpa totam est." ]]
    [[ "${lines[1]}" = "# Voluptatem libero eos voluptates culpa" ]]
}

@test "QUIET=true p \"test\"" {
    QUIET=true run p "test"
    [[ "$status" -eq 0 ]]
    [[ "${#lines[@]}" -eq 0 ]]
}
