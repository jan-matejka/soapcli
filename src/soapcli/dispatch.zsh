#! /usr/bin/env zsh

SELF="${0##*/}"
. soapcli-prelude

check-arg "self" ${1:-}
check-arg "command" ${2:-}

export SOAPCLI_CACHE_XML_TEMPLATES=$SOAPCLI_CACHE_HOME/xml-tpl
mkdir -p $SOAPCLI_CACHE_XML_TEMPLATES

cmd=$1-$2
shift 2
check-executable $cmd

$cmd "$@"
