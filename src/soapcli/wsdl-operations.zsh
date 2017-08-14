#! /usr/bin/env zsh

SELF="${0##*/}"
. soapcli-prelude

printf "%s\0" *.wsdl |
  xargs -0 -n1 -I% sh -c "xml sel -t -v '//wsdl:operation/@name' <  %"
