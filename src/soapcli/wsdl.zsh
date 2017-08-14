#! /usr/bin/env zsh

SELF="${0##*/}"
. soapcli-prelude

exec soapcli-dispatch $SELF "$@"
