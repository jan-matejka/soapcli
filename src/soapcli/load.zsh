#! /usr/bin/env zsh

SELF="${0##*/}"
. soapcli-prelude

setopt err_exit

declare -a args
zparseopts -K -D -a args v -verbose

declare -a save_globs
for i in $@; do
  if [[ ${i[1,1]} = '/' ]]; then
    save_globs+=( $i )
  else
    save_globs+=( $(pwd)/$i )
  fi
done

find $SOAPCLI_CACHE_XML_TEMPLATES -delete
mkdir $SOAPCLI_CACHE_XML_TEMPLATES

files=(${~@})
cp $files $SOAPCLI_CACHE_XML_TEMPLATES

out=2
(( ${args[(I)-v]} || ${args[(I)--verbose]} )) || out=/dev/null

cd $SOAPCLI_CACHE_XML_TEMPLATES
wsdls=(*.wsdl)

printf "%s\n" $wsdls | redir -2 $out xargs -n1 -I% -- wsdl2h %
printf "%s\n" ${wsdls//.wsdl/.h} | redir -2 $out xargs -n1 -I% -- soapcpp2 %

soapcli config load.globs "$save_globs"
