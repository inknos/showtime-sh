#! /usr/bin/env bats

load ../import_showtime.bash

@test "_export_md_header 1" {
    run _export_md_header 1 "This is a header"
    (( status == 0 ))
    [[ "${lines[0]}" = "# This is a header" ]]
    [[ "${lines[1]}" = "" ]]
}

@test "_export_md_header 2" {
    run _export_md_header 2 "This is a header"
    (( status == 0 ))
    [[ "${lines[0]}" = "## This is a header" ]]
    [[ "${lines[1]}" = "" ]]
}

@test "_export_md_header 3" {
    run _export_md_header 3 "This is a header"
    (( status == 0 ))
    [[ "${lines[0]}" = "### This is a header" ]]
    [[ "${lines[1]}" = "" ]]
}

@test "_export_md_header 4" {
    run _export_md_header 4 "This is a header"
    (( status == 0 ))
    [[ "${lines[0]}" = "#### This is a header" ]]
    [[ "${lines[1]}" = "" ]]
}

@test "_export_md_header 5" {
    run _export_md_header 5 "This is a header"
    (( status == 0 ))
    [[ "${lines[0]}" = "##### This is a header" ]]
    [[ "${lines[1]}" = "" ]]
}

@test "_export_md_header 6" {
    run _export_md_header 6 "This is a header"
    (( status == 0 ))
    [[ "${lines[0]}" = "###### This is a header" ]]
    [[ "${lines[1]}" = "" ]]
}



