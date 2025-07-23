#! /usr/bin/env bats

setup() {
    export BATS_LIB_PATH=${BATS_LIB_PATH:-"/usr/lib"}
    bats_load_library bats-support
    bats_load_library bats-assert

    load ../import_showtime.bash
}


@test "_export_md_header 1" {
    run _export_md_header 1 "This is a header"
    assert_success
    assert_output "# This is a header"
}

@test "_export_md_header 2" {
    run _export_md_header 2 "This is a header"
    assert_success
    assert_output "## This is a header"
}

@test "_export_md_header 3" {
    run _export_md_header 3 "This is a header"
    assert_success
    assert_output "### This is a header"
}

@test "_export_md_header 4" {
    run _export_md_header 4 "This is a header"
    assert_success
    assert_output "#### This is a header"
}

@test "_export_md_header 5" {
    run _export_md_header 5 "This is a header"
    assert_success
    assert_output "##### This is a header"
}

@test "_export_md_header 6" {
    run _export_md_header 6 "This is a header"
    assert_success
    assert_output "###### This is a header"
}
