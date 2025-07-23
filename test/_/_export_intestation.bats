#! /usr/bin/env bats

setup() {
    export BATS_LIB_PATH=${BATS_LIB_PATH:-"/usr/lib"}
    bats_load_library bats-support
    bats_load_library bats-assert

    load ../import_showtime.bash
}


@test "_export_intestation" {
    run _export_intestation
    assert_failure
    assert_output ""
}

@test "EXPORT_FORMAT='sh' _export_intestation" {
    EXPORT_FORMAT='sh' run _export_intestation
    assert_success
    assert_output "#!/bin/bash"
}

@test "EXPORT_FORMAT='md' _export_intestation" {
    EXPORT_FORMAT='md' run _export_intestation
    assert_success
    assert_output ""
}

@test "_export_sh_intestation" {
    run _export_sh_intestation
    assert_success
    assert_output "#!/bin/bash"
}
