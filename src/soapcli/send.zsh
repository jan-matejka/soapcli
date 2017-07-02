#! /usr/bin/env zsh

SELF="${0##*/}"
. soapcli-prelude

declare -a proxy
proxy=($(soapcli config proxy))
(( ${#proxy} )) && proxy=( "-x" $proxy )

exec \
  curl \
    ${proxy} \
    --header "Content-Type: text/xml;charset=UTF-8" \
    -d@- \
    --silent \
    --show-error \
    $(soapcli config endpoint) |
  xmllint --format -
