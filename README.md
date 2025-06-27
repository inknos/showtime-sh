# showtime

Supercharge your bash demo with this simple script.

[![asciicast](https://asciinema.org/a/9TYkJ1coAkzbUucHj2a0nDGmz.svg)](https://asciinema.org/a/9TYkJ1coAkzbUucHj2a0nDGmz)

## Getting showtime

```bash
curl -O https://codeberg.org/inknos/showtime/raw/branch/main/show
```

Then inside your demo

```bash
#!/bin/bash

source ./show

p "Hello world!"
```

If run it directly by:

```bash
curl -O https://codeberg.org/inknos/showtime/raw/branch/main/show
chmod +x run
./show examples/minimal
```

Inside of the directory you need to have at least a `demo.sh` file.
Inside each demo directory you can make use of other files as well like
`clean.sh`, `offline.sh` and `theme.sh`. None of these files are
mandatory.

```bash
# $ tree examples/
# examples/
# ├── colors
# │   ├── demo.sh
# │   └── theme.sh
# ├── full
# │   ├── clean.sh
# │   ├── demo.sh
# │   └── offline.sh
# └── minimal
#     └── demo.sh
```

## Run in a container

```bash
# clone the repo and cd into it
podman build -t showtime .
podman run --rm -it showtime examples/minimal
```

Builds will come...

## Install as RPM

```bash
dnf copr enable -y nsella/showtime
dnf install -y showtime
```

## Direct usage

```bash
# Run a demo with
./examples/minimal/demo.sh

# Skip wait times with `GOON`
GOON=true ./examples/minimal/demo.sh

# Export your code to stdout with `EXPORT` (defaults to sh)
EXPORT=true ./examples/minimal/demo.sh

# Export to sh
EXPORT_FORMAT=sh ./examples/mimimal/demo.sh

# Export to md
EXPORT_FORMAT=md ./examples/mimimal/demo.sh

# Rrun without printing with `QUIET`
QUIET=true ./examples/minimal/demo.sh

# Dry Run the demo with `DRYRUN`
DRYRUN=true ./examples/minimal/demo.sh

# Run with debug messages enabled (uses e)
DEBUG=true ./example/minimal/demo.sh

# Run debug messages only
DEBUG=true QUIET=true ./example/minimal/demo.sh
```

## Usage with `./show` script (it's a bit buggy)

```bash
# Run demos with:
./show examples/minimal

# Skip wait times with -y
./show examples/minimal -y

# Perform a dryrun
./show examples/minimal --dryrun

# Define and run clean steps with `--clean`
./show examples/minimal --clean

# Define and run offline setup for your demos with `--offline`
./show examples/minimal --offline

# Export your code to a bash file with `--export`
./show examples/minimal --export

# Export to different formats [sh/md]
./show example/minimal --export sh
```


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
- implement w time to optionally wait some seconds
- ./show --dryrun examples/minimal enters bash and it shouldn't
- ./show -y examples/minimal enters bash and it shouldn't
- ./show --export md examples/minimal prints Running...
- ./show -q examples/minimal prints Running...
