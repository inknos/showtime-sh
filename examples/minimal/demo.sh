#!/bin/bash

source ../../showtime.sh

h "This is a great demo!"

p "Print headers with h.

And print messages with p,
of course they can be multiline printouts

...because it's bash!"

p "Wait for user input with w:"

w

hh "A header"

p "with no clear command after it. Use hh for it and if you are running very long lines such as this one don't worry, the p function will split the lines conveniently."

w

p "Exec a shell command with e:"

e "ls -l"

p "Exec a long command with a 2 seconds timeout in case it hangs with et <timeout>:"

et "sleep 200" 2

w

p "Get into a subshell and run commands with b:"

b

p "Did you notice the demos are running in a shubshell with the history being
generated from the commands that are being run during the \`e\` steps?

If you didn't notice jump in again by breaking the execution. Press ^C
and wait for the shell to spawn"

w

p "Back on track! End of the demo.

Bye!"

w


