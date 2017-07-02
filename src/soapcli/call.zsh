#! /usr/bin/env zsh

SELF="${0##*/}"
. soapcli-prelude

setopt err_exit

check-arg "method" ${1:-}

told=$(mktemp)
tnew=$(mktemp)
trap "rm $told $tnew" EXIT

creator=($(soapcli config call.creator))
(( ${#creator} )) || creator=(soapcli create)

${creator} $1 >$told
vim $told
cat $told | soapcli send >$tnew
vim $tnew
