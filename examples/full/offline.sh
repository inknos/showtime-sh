#!/bin/bash

source ../../showtime.sh

# I recommend using p only and run the commands directly
p "Perform this step that requires internet and be used for a demo"

mkdir -p /tmp/showtime_full
curl -O https://codeberg.org/inknos/showtime/raw/branch/main/showtime.sh
mv showtime.sh /tmp/showtime_full

