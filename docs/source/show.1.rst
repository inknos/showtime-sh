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
:   Run the clean script for the demo.

    See :ref:`clean.sh <show-dir-structure-clean-sh>` for more information.

.. _show-cli-options-y:

**-y**
:   Run demo without pausing.

    See :ref:`GOON <show-environment-variables-runtime-goon>` for more information.

.. _show-cli-options-export:

**--export** / **--export sh** / **--export md**
:   Export demo to stdout in shell script format.

    See :ref:`EXPORT <show-environment-variables-runtime-export>` and
    :ref:`EXPORT_FORMAT <show-environment-variables-runtime-export-format>` for more information.

.. _show-cli-options-offline:

**--offline**
:   Run offline steps for the demo.

    See :ref:`offline.sh <show-dir-structure-offline-sh>` for more information.

.. _show-cli-options-quiet:

**--quiet**
:   Run without printing anything.

    See :ref:`QUIET <show-environment-variables-runtime-quiet>` for more information.

.. _show-cli-options-dryrun:

**--dryrun**
:   Run everything without executing commands.

    See :ref:`DRYRUN <show-environment-variables-runtime-dryrun>` for more information.

.. _show-cli-options-help:

**-h, --help**
:   Show the help message and exit

.. _show-dir-structure:

DIR STRUCTURE
=============

To make the best from this package, you should create a directory for your demo.
The file structure should be organized as follows. There is one mandatory file, which is **demo.sh**,
but you can add other files to it like **clean.sh**, **offline.sh**, and **theme.sh**.

.. code-block:: bash

    my-demo/
    ├── demo.sh
    ├── clean.sh
    ├── offline.sh
    └── theme.sh

.. _show-dir-structure-demo-sh:

**demo.sh**

Contains your demo and it's the main argument that **show** looks for. The syntax is bash of course,
and you can do all kind of operations inside it and use the functions listed
in the :ref:`FUNCTIONS <show-functions>` section to create your demo.

.. _show-dir-structure-clean-sh:

**clean.sh**

Contains the clean script for your demo.
It's executed with the :ref:`--clean<show-cli-options-clean>` option and it's optional.

.. _show-dir-structure-offline-sh:

**offline.sh**

Contains the offline script for your demo, and it is optional.

Let's say that you need to have some steps which will require to download some big
files that you don't want to run every time you run the demo.
This is where **offline.sh** comes in. It will be executed with
the :ref:`--offline <show-cli-options-offline>` option. It is optional.

.. _show-dir-structure-theme-sh:

**theme.sh**

Contains the theme for your demo. It's included by if you
run the demo with the :ref:`run <show-cli-options>` command.
You should define there a bunch of variables that are documented under
:ref:`CUSTOMIZATION <show-environment-variables-customization>` section.

.. _show-functions:

FUNCTIONS
=========

You can define functions within your bash script that you call `demo.sh`. These functions will handle the demo steps with nice output and user interaction.

.. _show-functions-headers:

HEADERS
-------

.. _show-functions-headers-h1:

**h1** *<header_title>*
:   Print a single header 1 and clear output

    *QUIET=true* will not print the header and *EXPORT=true* will print the header in shell script format by default.
    The same applies to other header functions.

    Example 1:

    .. code-block:: bash

        bash -c 'source /bin/show; h1 "Header 1"'

        ##################
        #  Header 1
        ##################

    Example 2:

    .. code-block:: bash

        bash -c 'source /bin/show; EXPORT_FORMAT=md h1 "Header 1"'

        # Header 1

.. _show-functions-headers-h2:

**h2** *<header_title>*
:   Print a single header 2 and do not clear output. Refer to :ref:`h1 <show-functions-headers-h1>` for more information.

    Example 1:

    .. code-block:: bash

        bash -c 'source /bin/show; h2 "Header 2"'

        ##################
        # Header 2
        ##################

    Example 2:

    .. code-block:: bash

        bash -c 'source /bin/show; EXPORT_FORMAT=md h2 "Header 2"'

        ## Header 2

.. _show-functions-headers-h3:

**h3** *<header_title>*
:   Print a single header 3 and do not clear output. Refer to :ref:`h1 <show-functions-headers-h1>` for more information.

    .. code-block:: bash
    
        bash -c 'source /bin/show; EXPORT_FORMAT=md h3 "Header 3"'

        ### Header 3

.. _show-functions-headers-h4:

**h4** *<header_title>*
:   Print a single header 4 and do not clear output. Refer to :ref:`h1 <show-functions-headers-h1>` for more information.

    .. code-block:: bash
    
        bash -c 'source /bin/show; EXPORT_FORMAT=md h4 "Header 4"'

        #### Header 4

.. _show-functions-headers-h5:

**h5** *<header_title>*
:   Print a single header 5 and do not clear output. Refer to :ref:`h1 <show-functions-headers-h1>` for more information.

    .. code-block:: bash
    
        bash -c 'source /bin/show; EXPORT_FORMAT=md h5 "Header 5"'

        ##### Header 5

.. _show-functions-headers-h6:

**h6** *<header_title>*
:   Print a single header 6 and do not clear output. Refer to :ref:`h1 <show-functions-headers-h1>` for more information.

    .. code-block:: bash
    
        bash -c 'source /bin/show; EXPORT_FORMAT=md h6 "Header 6"'

        ##### Header 6

**h** *<header_title>*
:   Alias to :ref:`h1 <show-functions-headers-h1>`

**hh** *<header_title>*
:   Alias to :ref:`h2 <show-functions-headers-h2>`

**hhh** *<header_title>*
:   Alias to :ref:`h3 <show-functions-headers-h3>`

**hhhh** *<header_title>*
:   Alias to :ref:`h4 <show-functions-headers-h4>`

**hhhhh** *<header_title>*
:   Alias to :ref:`h5 <show-functions-headers-h5>`

**hhhhhh** *<header_title>*
:   Alias to :ref:`h6 <show-functions-headers-h6>`

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

**pi** *<text>*
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

    The functions listed below are only run if *DEBUG=true*. Check :ref:`DEBUG <show-environment-variables-runtime-debug>` for more information.

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

**w** *[<time>]*

:    Wait for user input to continue. If *<time>* is provided, automatically
    continue after that many seconds, but user can press Enter to continue immediately.

    Skipped if *GOON=true* and output silenced if *QUIET=true* but it still waits for *<time>* seconds or until user presses enter.

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

Colors and symbols that can be customized. All color variables start with
*C_* and all symbol variables start with *S_* and are documented below.
Names should be self-explanatory.

**C_HEADER**
:   Color for header. Default is *cyan*

**C_HEADER_TEXT**
:   Color for header text. Default is *white*

**C_SUCCESS**
:   Color for success. Default is *green*

**C_ERROR**
:   Color for error. Default is *red*

**C_WARNING**
:   Color for warning. Default is *yellow*

**C_INFO**
:   Color for info. Default is *blue*

**C_DEBUG**
:   Color for debug. Default is *purple*

**C_COMMAND**
:   Color for command symbol. Default is *red*

**C_COMMAND_TEXT**
:   Color for command text. Default is *white*

**C_TEXT**
:   Color for text. Default is *yellow*

**C_BULLET**
:   Color for the bullet. Default is *green*

**C_PROMPT**
:   Color for prompt. Default is *dim cyan*

**C_INTERACTIVE**
:   Color for interactive prompt. Default is *purple*

**C_SEPARATOR**
:   Color for separator. Default is *dim cyan*

**S_SUCCESS**
:   Symbol for success. Default is *✓*

**S_INFO**
:   Symbol for info. Default is *ℹ*

**S_WARNING**
:   Symbol for warning. Default is *⚠*

**S_ERROR**
:   Symbol for error. Default is *✗*

**S_DEBUG**
:   Symbol for debug. Default is *$*

**S_COMMAND**
:   Symbol for command. Default is *$*

**S_BULLET**
:   Symbol for bullet. Default is *➤*

.. _show-environment-variables-runtime:

RUNTIME
-------

Variables that affect the runtime of the demo. It's better to avoid using them directly
but to run your code by invoking the :ref:`run <show-cli-options>` command.

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
:   Defines the format of the exported demo. Allowed values are:

    * **sh**: exports demo in shell script format
    * **md**: exports demo in markdown format

    Set *EXPORT=true*, *QUIET=true* and *GOON=true*

.. _show-environment-variables-runtime-quiet:

**QUIET**
:   If *true*, disables all output
    
    Set *GOON=true*

