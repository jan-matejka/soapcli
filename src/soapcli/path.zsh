#! /usr/bin/env zsh

SELF="${0##*/}"
. soapcli-prelude

setopt err_exit
check-arg "path" $1

case $1 in
xml-tpl)
  echo $SOAPCLI_CACHE_XML_TEMPLATES
  ;;
*)
  fatal "unknown path: %s" "$1"
  ;;
esac
