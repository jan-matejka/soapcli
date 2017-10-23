#! /usr/bin/env zsh

SELF="${0##*/}"
. soapcli-prelude

declare -a proxy
proxy=($(soapcli config proxy))
(( ${#proxy} )) && proxy=( "-x" $proxy )

opts=($(soapcli config "curl.options"))

exec \
  curl \
    ${proxy} \
    --header "Content-Type: text/xml;charset=UTF-8" \
    --data-binary @- \
    --silent \
    --show-error \
    $opts \
    $(soapcli config endpoint) |
  xmllint --format -
