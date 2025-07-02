`Showtime.sh`
=============

Supercharge your bash demo with this simple script.

Showtime.sh is the original name of a script that I used to `source` in
scripts that I used to demo a feature used in a presentation


Table of Contents
-----------------

* [Features](#features)
* [Install](#install)
  * [Standalone script](#standalone-script)
  * [Container](#container)
  * [Install on Linux](#install-on-linux)
* [Usage](#usage)

Features
--------

Install
-------

### Standalone script

```bash
git clone https://codeberg.org/inknos/showtime-sh.git
cd showtime-sh
./show examples/minimal
```

### Container

```bash
git clone https://codeberg.org/inknos/showtime-sh.git
cd showtime-sh
podman build -t showtime-sh .
podman run --rm -it -v $PWD/examples:/examples:Z showtime-sh examples/minimal
```

Container builds will come...

### Install on Linux

#### Install as RPM

```bash
dnf copr enable -y nsella/showtime-sh
dnf install -y showtime-sh
```

Usage
-----

### Use the `show` command

The `show` script provides a convenient way to run you demos.
The script always looks for a `demo.sh` file inside the directory that
you are passing as a command optrion.
`demo.sh` is the only file explicitely required but you can specify
other files that can be used by `show`.
Inside each demo directory you can make use of `clean.sh`,
`offline.sh` and `theme.sh`. None of these files are mandatory.

```bash
# $ tree examples/
# examples/
# ├── colors
# │   ├── demo.sh     #  mandatory
# │   └── theme.sh    #  optional but always sourced by `show`
# ├── full
# │   ├── clean.sh    #  optional and sourced only with --clean
# │   ├── demo.sh     #  mandatory
# │   └── offline.sh  #  optional and sourced only with --offline
# └── minimal
#     └── demo.sh     #  mandatory
```

Basic run

```bash
./show examples/minimal
# Equivalent to
# bash -c 'source ./show; source./examples/minimal/demo.sh'
```

Run a demo skipping all wait times with -y

```bash
./show examples/minimal -y
# Equivalent to
# bash -c 'source ./show; GOON=true source examples/minimal/demo.sh'
```

Perform a dryrun of the demo. All commands will be printed but not executed

```bash
./show examples/minimal --dryrun
# Equivalent to
# bash -c 'source ./show; DRYRUN=true source examples/minimal/demo.sh
```

Run a script quietly
```bash
./show examples/minimal --quiet
# Equivalent to
# bash -c 'source ./show; QUIET=true source examples/minimal/demo.sh
```

Define run clean steps with `--clean`. This will call and execute
`examples/minimal/clean.sh`

```bash
./show examples/minimal --clean
# Equivalent to
# bash -c 'source ./show; source examples/minimal/clean.sh'
```

Define and run offline setup for your demos with `--offline`. This will
call and execute `examples/minimal/offline.sh`
```bash
./show examples/minimal --offline
# Equivalent to
# bash -c 'source ./show; source examples/minimal/clean.sh'
```

Export your code to a bash file with `--export`. This way you can
transform your `demo.sh` file to a convenient bash script or a writeup
ready to be published in your blog.
```bash
./show examples/minimal --export sh
./show examples/minimal --export md
# Equivalent to
# bash -c 'source ./show; EXPORT_FORMAT=sh source ./examples/mimimal/demo.sh'
# bash -c 'source ./show; EXPORT_FORMAT=md source ./examples/mimimal/demo.sh'
```

### Source `show` in any bash script

As said before, Showtime can be run equivalently by importing it at the
top of your files. As a matter of fact, this script was intially thought
to be run inside your demo, whether it's called `demo.sh` or with any
other name.
Later, it became more convenient to just use it as a command that would
but you can still experiment with sourcing it and exploit its full power.

### Demo

[![asciicast](https://asciinema.org/a/9TYkJ1coAkzbUucHj2a0nDGmz.svg)](https://asciinema.org/a/9TYkJ1coAkzbUucHj2a0nDGmz)

### Write your first demo

...

Themes
------

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

Contribute
----------

### Tests

Run all tests with [`bats`](https://github.com/bats-core/bats-core)

```bash
bats --tap tests/*
```


---

TODOs, ideas and issues
-----------------------

- make skip header configurable
- make messages configurable by user
- fix history duplicating in bash
- make ^C timeout configurable
- make ^C trap optionally on or off
