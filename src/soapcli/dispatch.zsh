#! /usr/bin/env zsh

SELF="${0##*/}"
. soapcli-prelude

check-arg "self" ${1:-}
check-arg "command" ${2:-}

cmd=$1-$2
shift 2
check-executable $cmd

$cmd "$@"
