.. _show:

NAME
====

show - Bash script to supercharge CLI demos

.. _show-synopsis:

SYNOPSIS
========

**show** *demo_name* [*OPTION*]

.. _show-description:

DESCRIPTION
===========

.. _show-cli-options:

CLI OPTIONS
===========

.. _show-cli-options-clean:

**--clean**
:   Run the clean script for the demo (clean.sh)

.. _show-options-y:

**-y**
:   Run demo without pausing
    
    Sets *GOON=true*

.. _show-options-export:

**--export** / **--export sh** / **--export md**
:   Export demo to stdout in shell script format

    Sets *EXPORT=true* and *EXPORT_FORMAT={sh.md}*

.. _show-options-offline:

**--offline**
:   Run offline steps for the demo (offline.sh)

.. _show-options-quiet:

**--quiet**
:   Run without printing anything

    Sets *QUIET=true*

.. _show-options-dryrun:

**--dryrun**
:   Run everything without executing commands

.. _show-options-help:

**-h, --help**
:   Show the help message and exit


.. _show-dir-structure:

DIR STRUCTURE
=============

You should create a directory for your demo. The only mandatory file is **demo.sh** but you can add other files to it like **clean.sh**, **offline.sh**, and **theme.sh**

.. _show-dir-structure-demo-sh:

**demo.sh**

Contains your demo. Use the functions listed in the `FUNCTIONS <_show_functions>` section to create your demo.

**clean.sh**

Contains the clean script for your demo. It's executed with the `--clean <_show_cli-options-clean>` option.

**offline.sh**

Contains the offline script for your demo.

Let's say that you need to have some steps which will require to download some big files that you don't want to run every time you run the demo.
This is where **offline.sh** comes in. **offline.sh** will be executed with the `--offline <_show_cli-options-offline>` option.

**theme.sh**

Contains the theme for your demo. It's included by default if you run the demo with the `run <_show_cli-options>` command.

An example of dir structure could look like this:

.. code-block:: bash

    my-demo/
    ├── demo.sh
    ├── clean.sh
    ├── offline.sh
    └── theme.sh

You can run the demo with *run my-demo* or *run my-demo/demo.sh*

.. _show-functions:

FUNCTIONS
=========

You can define functions within your bash script that you call `demo.sh`. These functions will handle the demo steps with nice output and user interaction.

.. _show-functions-headers:

HEADERS
-------

.. _show-functions-headers-h:

**h** *<header_title>*
:   Print a single header 1 and clear output

    Example 1:

    .. code-block:: bash

        bash -c 'source /bin/show; h "Header 1"'

        ##################
        #  Header 1
        ##################

    Example 2:

    .. code-block:: bash

        bash -c 'source /bin/show; EXPORT_FORMAT=md h "Header 1"'

        # Header 1


**hh** *<header_title>*
:   Print a single header 2 and clear output

    Example 1:

    .. code-block:: bash

        bash -c 'source /bin/show; hh "Header 2"'

        ##################
        # Header 2
        ##################

    Example 2:

    .. code-block:: bash

        bash -c 'source /bin/show; EXPORT_FORMAT=md hh "Header 2"'

        ## Header 2

**hhh** *<header_title>*
:   Print a single header 3 and do not clear output

    .. warning::
        Not implemented yet

**hhhh** *<header_title>*
:   Print a single header 4 and do not clear output

    .. warning::
        Not implemented yet

**hhhhh** *<header_title>*
:   Print a single header 5 and do not clear output

    .. warning::
        Not implemented yet

**hhhhhh** *<header_title>*
:   Print a single header 6 and do not clear output

    .. warning::
        Not implemented yet

**h1** *<header_title>*
:   Same as **h**

    .. warning::
        Not implemented yet

**h2** *<header_title>*
:   Same as **hh**

    .. warning::
        Not implemented yet

**h3** *<header_title>*
:   Same as **hhh**

    .. warning::
        Not implemented yet

**h4** *<header_title>*
:   Same as **hhhh**

    .. warning::
        Not implemented yet

**h5** *<header_title>*
:   Same as **hhhhh**

    .. warning::
        Not implemented yet

**h6** *<header_title>*
:   Same as **hhhhhh**

    .. warning::
        Not implemented yet

.. _show-functions-print:

PRINT
-----

.. _show-functions-print-p:

**p** *<text>*
:   Print text. If text is longer than 80 characters, it will be wrapped.

    Silenced by *QUIET=true*

    Example:

    .. code-block:: bash

        bash -c 'source /bin/show; p "Text"'

        ➤ Text

.. _show-functions-print-pi:

**pi** *<text>* / **info** *<text>*
:   Print info text. If text is longer than 80 characters, it will be wrapped.

    Silenced by *QUIET=true*

    Example:

    .. code-block:: bash

        bash -c 'source /bin/show; EXPORT_FORMAT=sh pi "Info text"'

        # INF: Info text

.. _show-functions-print-pw:

**pw** *<text>*
:   Print warning text. If text is longer than 80 characters, it will be wrapped.

    Silenced by *QUIET=true*

    Example:

    .. code-block:: bash

        bash -c 'source /bin/show; EXPORT_FORMAT=sh pw "Warning text"'

        # WRN: Warning text

.. _show-functions-print-pe:

**pe** *<text>*
:   Print error text. If text is longer than 80 characters, it will be wrapped.

    Silenced by *QUIET=true*

    Example:

    .. code-block:: bash

        bash -c 'source /bin/show; EXPORT_FORMAT=sh pe "Error text"'

        # ERR: Error text

.. _show-functions-print-ps:

**ps** *<text>*
:   Print success text. If text is longer than 80 characters, it will be wrapped.

    Silenced by *QUIET=true*

.. _show-functions-exec:

EXEC
----

.. _show-functions-exec-e:

**e** *<command>*
:   Print and execute a command.

    Silenced by *QUIET=true* and printed only if *DRYRUN=true*

    Example:

    .. code-block:: bash

        bash -c 'source /bin/show; e "echo Hello"'

        $ echo Hello
        Hello

.. _show-functions-exec-et:

**et** *<command>* *<time>*
:   Print and execute a command and exits after *<time>* seconds to continue the execution of the demo.

    Silenced by *QUIET=true* and printed only if *DRYRUN=true*

.. _show-functions-debug:

DEBUG
-----

.. warning::

    The functions listed below are only run if *DEBUG=true*.

.. _show-functions-debug-d:

**d** *<text>*
:   Print debug text. If text is longer than 80 characters, it will be wrapped. Always printed.

    Not silenced by *QUIET=true*, can't be exported with *EXPORT=true*

.. _show-functions-debug-ed:

**ed** *<command>*
:   Print and execute a debug command. Always executed.

    Not silenced by *QUIET=true*, can't be exported with *EXPORT=true*

.. _show-functions-wait:

WAIT
----

.. _show-functions-wait-w:

**w** *<time>*

:    Wait for time until continuuing. If *<time>* is not provided, wait for user to press enter to continue

    Skipped if *GOON=true* and output silenced if *QUIET=true* but it still waits for *<time>* seconds or until user presses enter

.. _show-functions-bash:

BASH
----

.. _show-functions-bash-b:

**b**
:   Enters an interactive bash shell.

    Skipped if *QUIET=true*, *DRYRUN=true*, and *GOON=true*



.. _show-environment-variables:

ENVIRONMENT VARIABLES
=====================

.. _show-environment-variables-customization:

CUSTOMIZATION
-------------

Colors and Symbols

.. _show-environment-variables-runtime:

RUNTIME
-------

Variables that affect the runtime of the demo. It's better to avoid using them directly but to run your code by invoking the `run <_show_cli-options>` command.

.. _show-environment-variables-runtime-debug:

**DEBUG**
:   If *true*, enables debug output for **d** and **ed** functions

.. _show-environment-variables-runtime-dryrun:

**DRYRUN**
:   If *true*, commands are printed and registered in bash history, but not executed

.. _show-environment-variables-runtime-goon:

**GOON**
:   If *true*, skips waiting for user input

    Set *QUIET=true*

.. _show-environment-variables-runtime-export:

**EXPORT**
:   If *true*, exports demo in script format instead of running

    Cannot be used with *DRYRUN=true*

    Set *QUIET=true* and *GOON=true*

.. _show-environment-variables-runtime-export-format:

**EXPORT_FORMAT**
:   If *sh*, exports demo in shell script format

    If *md*, exports demo in markdown format

    Set *EXPORT=true*, *QUIET=true* and *GOON=true*

.. _show-environment-variables-runtime-quiet:

**QUIET**
:   If *true*, disables all output
    
    Set *GOON=true*

