#!/usr/bin/env bats

setup() {
    if [ $(basename $(pwd)) = "env"]; then
        source ../../showtime.sh
    else
        source showtime.sh
    fi
}

# @test "EXPORT=true ./test-export.sh | wc -l" {
#     result=$(EXPORT=true bash -c './examples/minimal/demo.sh | wc -l)
#     [ $result -eq 10 ]
# }
