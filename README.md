# showtime

Supercharge your bash demo with this simple script.

[![asciicast](https://asciinema.org/a/9TYkJ1coAkzbUucHj2a0nDGmz.svg)](https://asciinema.org/a/9TYkJ1coAkzbUucHj2a0nDGmz)

## Getting showtime.sh

```bash
curl -O https://codeberg.org/inknos/showtime/raw/branch/main/showtime.sh
```

Then inside your demo

```bash
#!/bin/bash

source ./showtime.sh

p "Hello world!"
```

If you want to run it using the ./run wrapper you can use 

```bash
curl -O https://codeberg.org/inknos/showtime/raw/branch/main/run
chmod +x run
./run <directory>
```

Inside of the directory you need to have at least a `demo.sh` file.
Inside each demo directory you can make use of other files as well like
`clean.sh`, `offline.sh` and `theme.sh`. None of these files are
mandatory.


## Usage with `./run` script

```bash
# Run demos with:
./run examples/minimal

# Skip wait times with -y
./run examples/minimal -y

# Export your code to a bash file with `--export`
./run examples/minimal --export

# Define and run clean steps with `--clean`
./run examples/minimal --export

# Define and run offline setup for your demos with `--offline`
./run examples/minimal --offline
```

## Usage with env variables

```bash
# Run a demo with
./examples/minimal/demo.sh

# Skip wait times with `GOON`
GOON=true ./examples/minimal/demo.sh

# Export your code to stdout with `EXPORT`
EXPORT=true ./examples/minimal/demo.sh

# Rrun without printing with `QUIET`
QUIET=true ./examples/minimal/demo.sh

# Dry Run the demo with `DRYRUN`
DRYRUN=true ./examples/minimal/demo.sh
```

## Functions

### `h`

*Header*

Prints a header and clears the terminal before printing.

`QUIET=true` skips it

### `hh`

*Header 2*

Prints a sub heade and does not clean before printing.

`QUIET=true` skips it

### `p`

*Print*

Prints a message. Wraps lines longer than 78 characters.

`QUIET=true` skips it

### `pi`

*Print Info*

Prints a `INF:` like message

`QUIET=true` skips it

### `pw`

*Print Warning*

Prints a `WRN:` like message

`QUIET=true` skips it

### `pe`

*Print Error*

Prints an `ERR` like message

`QUIET=true` skips it

### `d`

*Debug*

Prints a debug line that cannot be quieted.

`QUIET=true` does not affect

### `e`

*Exec*

Exec a piece of code.

`DRYRUN=true` Registers the command in the history but does not run it
`QUIET=true` Quiets the output

### `et <timeout>`

*Exec Timeout*

Same as `e` but with timeout in seconds.

### `ed`

*Exec Debug*

Same as `e` but prints like `d` and always execs the code, even when `DRYRUN=true`

`QUIET=true` does not affect

### `w`

*Wait*

Waits for enter and prints `Press Enter to continue...`.

`GOON=true` skips it
`DRYRUN=true` does not affect
`QUIET=true` skips it

### `b`

*Bash*

Brings up an interactive shell. The history of the shell is the sequence of the commands entered in the demo since this point.

`GOON=true` skips it
`DRYRUN=true` does not affect
`QUIET=true` skips it


## Themes

You can customize colors and symbols by creating a `theme.sh` file in your demo directory. This file will be automatically loaded when your demo runs.

Run the color demo to see it in action

```bash
./run examples/colors
```

### Creating a Custom Theme

Create a `theme.sh` file in the same directory as your demo:

```bash
#!/bin/bash
# Custom theme for your demo

# Base colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
BOLD='\033[1m'
DIM='\033[2m'

# Semantic color customization
export C_HEADER="$BLUE"                     # Header border color
export C_HEADER_TEXT="$WHITE$BOLD"         # Header text color
export C_SUCCESS="$GREEN"                  # Success symbol color
export C_ERROR="$RED"                      # Error symbol color
export C_WARNING="$YELLOW"                 # Warning symbol color
export C_INFO="$CYAN"                      # Info symbol color
export C_COMMAND="$PURPLE"                 # Command prompt color
export C_COMMAND_TEXT="$WHITE"             # Command text color
export C_TEXT="$CYAN"                      # Main text color
export C_BULLET="$BLUE"                    # Bullet symbol color
export C_INTERACTIVE="$PURPLE"             # Interactive prompt color
export C_PROMPT="$DIM$BLUE"               # "Press Enter" prompt color
export C_SEPARATOR="$DIM$BLUE"            # Separator line color

# Custom symbols
export S_BULLET="▶"                        # Bullet symbol (default: ➤)
```

### Available Color Variables

- `C_HEADER` - Header border lines
- `C_HEADER_TEXT` - Header text
- `C_SUCCESS` - Success messages (✓)
- `C_ERROR` - Error messages (✗)
- `C_WARNING` - Warning messages (⚠)
- `C_INFO` - Info messages (ℹ)
- `C_COMMAND` - Command prompt ($)
- `C_COMMAND_TEXT` - Command text
- `C_TEXT` - Main paragraph text
- `C_BULLET` - Bullet symbol color
- `C_INTERACTIVE` - Interactive bash prompt
- `C_PROMPT` - "Press Enter to continue" text
- `C_SEPARATOR` - Separator lines

### Available Symbol Variables

- `S_BULLET` - Bullet symbol for paragraphs (default: ➤)

The theme system uses fallback values, so you only need to define the colors you want to change.

## Tests

Run all tests with [`bats`](https://github.com/bats-core/bats-core)

```bash
bats --tap tests/*
```


---

## TODOs, ideas and issues

- make skip header configurable
- add h1 to h6
- make messages configurable by user
- fix history duplicating in bash
- make ^C timeout configurable
- make ^C trap optionally on or off
- ensure the logic of DRYRUN, QUIET, EXPORT is correct
