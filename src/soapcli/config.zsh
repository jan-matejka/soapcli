#! /usr/bin/env zsh

SELF="${0##*/}"
. soapcli-prelude

check-arg "name" ${1:-}
f=$SOAPCLI_CONFIG_HOME/$1

[[ -n "${2:-}" ]] && {
  mkdir -p $SOAPCLI_CONFIG_HOME
  printf >$f -- "$2"
  return
}

test -f $f || return 0
echo $(cat $f)
