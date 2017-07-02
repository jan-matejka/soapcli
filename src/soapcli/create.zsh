#! /usr/bin/env zsh

SELF="${0##*/}"
. soapcli-prelude

check-arg "request" ${1:-}

reqtpl=$SOAPCLI_CACHE_XML_TEMPLATES/$1.req.xml
test -f $reqtpl || fatal "Unknown method $1"

cat $reqtpl
