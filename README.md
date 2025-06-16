# showtime

Supercharge your bash demo with this simple script.

### Installation

```bash
curl -O https://codeberg.org/inknos/showtime/raw/branch/main/showtime.sh
```

Then inside your demo

```bash
#!/bin/bash

source ./showtime.sh

p "Hello world!"
```

### Examples

Check `examples/`


##### Run using the `./run` script

Run demos with:

```bash
./run examples/minimal
```

Skip wait times with -y

```bash
./run examples/minimal -y
```

Export your code to a bash file with `--export`

```bash
./run examples/minimal --export
```

Define and run clean steps with `--clean`

```bash
./run examples/minimal --export
```

Define and run offline setup for your demos with `--offline`

```bash
./run examples/minimal --offline
```

##### Run directly passing the env variables

Run a demo with

```bash
./examples/minimal/demo.sh
```

Skip wait times with `GOON`

```bash
GOON=true ./examples/minimal/demo.sh
```

Export your code to stdout with `EXPORT`

```bash
EXPORT=true ./examples/minimal/demo.sh
```

### Themes

You can customize colors and symbols by creating a `theme.sh` file in your demo directory. This file will be automatically loaded when your demo runs.

#### Creating a Custom Theme

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

#### Available Color Variables

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

#### Available Symbol Variables

- `S_BULLET` - Bullet symbol for paragraphs (default: ➤)

The theme system uses fallback values, so you only need to define the colors you want to change.

[![asciicast](https://asciinema.org/a/9TYkJ1coAkzbUucHj2a0nDGmz.svg)](https://asciinema.org/a/9TYkJ1coAkzbUucHj2a0nDGmz)
