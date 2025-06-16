#!/bin/bash

source ../../showtime.sh

h "Full example"

p "Create a temp directory that will be used for the demo"

e "mkdir -p /tmp/showtime_full"

p "Download a the showtime script and put it in the temp directory"

e "curl -O --skip-existing https://codeberg.org/inknos/showtime/raw/branch/main/showtime.sh"

e "mv showtime.sh /tmp/showtime_full"

