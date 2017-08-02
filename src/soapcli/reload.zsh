#! /usr/bin/env zsh

SELF="${0##*/}"
. soapcli-prelude

setopt err_exit

globs=($(soapcli config load.globs))
test -n "$globs" || return 0

soapcli load $globs
