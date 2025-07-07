#!/usr/bin/env bats

setup() {
    load ../import_showtime.bash
}


@test "pi \"test\"" {
    run pi 'test'
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = "${C_INFO@E}${S_INFO} test${NC@E}" ]]
}

@test "DRYRUN=true pi \"test\"" {
    DRYRUN=true run pi 'test'
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = "${C_INFO@E}${S_INFO} test${NC@E}" ]]
}

@test "EXPORT=true pi \"test\"" {
    EXPORT=true run pi 'test'
    [[ "$status" -eq 0 ]]
    [[ "${lines[0]}" = "# INF: test" ]]
}

@test "QUIET=true pi \"test\"" {
    QUIET=true run pi 'test'
    [[ "$status" -eq 0 ]]
    [[ "${#lines[@]}" -eq 0 ]]
}
