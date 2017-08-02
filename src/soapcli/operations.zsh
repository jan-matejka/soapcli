#! /usr/bin/env zsh

SELF="${0##*/}"
. soapcli-prelude

setopt err_exit

cd $SOAPCLI_CACHE_XML_TEMPLATES
ops=(*.req.xml)
ops=(${^ops%%.req.xml})
printf "%s\n" $ops
