#!/usr/bin/env bash

e "echo e"

et "echo et" 1

ed "echo ed"

e "cat ${_demo_histfile:?}"

ed "cat ${_demo_histfile:?}"
