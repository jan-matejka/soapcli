#! /usr/bin/env zsh

SELF="${0##*/}"
. soapcli-prelude

declare -a args
zparseopts -K -D -a args x
(( ${args[(I)-x]} )) && {
  set -x
  export SOAPCLI_XTRACE=true
}

xdgenv-exec SOAPCLI soapcli -- soapcli-dispatch $SELF "$@"
