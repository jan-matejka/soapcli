#! /usr/bin/env zsh

SELF="${0##*/}"
. soapcli-prelude

setopt err_exit
setopt null_glob

cd $SOAPCLI_CACHE_XML_TEMPLATES

ops=(*.req.xml)
(( ${#ops} )) || return 0

ops=(${^ops%%.req.xml})
printf "%s\n" $ops
