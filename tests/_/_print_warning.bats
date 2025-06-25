#!/usr/bin/env bats

setup() {
    if [ $(basename $(pwd)) = "_" ]; then
        source ../../showtime.sh
    else
        source showtime.sh
    fi
}


@test "S_WARNING is set" {
    [ -n "$S_WARNING" ]
}

@test "_print_warning" {
    run _print_warning 'test warning'
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" == *"WRN: test warning"* ]]
    [[ "${lines[0]}" == *"${S_WARNING}"* ]]
}

@test "_print_warning with custom symbol" {
    S_WARNING="W:" run _print_warning 'test warning'
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" == *"WRN: test warning"* ]]
    [[ "${lines[0]}" == *"W:"* ]]
}

@test "DRY_RUN=true _print_warning" {
    DRY_RUN=true run _print_warning 'test warning'
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" == *"WRN: test warning"* ]]
    [[ "${lines[0]}" == *"${S_WARNING}"* ]]
}

@test "DRY_RUN=true _print_warning with custom symbol" {
    DRY_RUN=true S_WARNING="W:" run _print_warning 'test warning'
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" == *"WRN: test warning"* ]]
    [[ "${lines[0]}" == *"W:"* ]]
}

@test "EXPORT=true _print_warning" {
    EXPORT=true run _print_warning 'test warning'
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = "# WRN: test warning" ]]
}

@test "EXPORT=true _print_warning with custom symbol changes nothing" {
    EXPORT=true S_WARNING="W:" run _print_warning 'test warning'
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = "# WRN: test warning" ]]
}

@test "QUIET=true _print_warning" {
    QUIET=true run _print_warning 'test warning'
    [ "$status" -eq 0 ]
    [[ "${lines[0]}" = "" ]]
} 