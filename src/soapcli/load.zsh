#! /usr/bin/env zsh

SELF="${0##*/}"
. soapcli-prelude

setopt err_exit

find $SOAPCLI_CACHE_XML_TEMPLATES -delete
mkdir $SOAPCLI_CACHE_XML_TEMPLATES

cp $@ $SOAPCLI_CACHE_XML_TEMPLATES

cd $SOAPCLI_CACHE_XML_TEMPLATES
wsdls=(*.wsdl)

setopt noerr_exit
printf "%s\n" $wsdls | xargs -n1 -I% -- wsdl2h % 2>/dev/null
printf "%s\n" ${wsdls//.wsdl/.h} | xargs -n1 -I% -- soapcpp2 % 2>/dev/null
