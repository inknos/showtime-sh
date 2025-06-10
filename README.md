# showtime

Helper scripts to make your bash demo incredible

### Installation

```bash
curl -O https://codeberg.org/inknos/showtime/raw/branch/main/showtime.sh
```

### Usage

```bash
#!/bin/bash

. showtime.sh

# Print a header
h "My awesome demo"

# Print a header without clearing the screen before"
hh "a sub header for my demo"

p "Print some nice message"

# exec a command
e "echo \"Exec a command\""

# exec some command with timeout
et "sleep 200" 20

# Wait for enter
w

# Interactively call bash with the history of the commands
# you used in the demo
b
```

Press `^C` to get to an interactive bash session during your demo

Press `^C` twice to get out


