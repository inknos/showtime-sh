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

[![asciicast](https://asciinema.org/a/9TYkJ1coAkzbUucHj2a0nDGmz.svg)](https://asciinema.org/a/9TYkJ1coAkzbUucHj2a0nDGmz)
