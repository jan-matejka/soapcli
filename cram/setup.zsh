#!/usr/bin/env zsh

export TESTTMP="$CRAMTMP/$TESTFILE"

FAKEPATH="$TESTTMP/path"
mkdir "${FAKEPATH}" || return
export PATH="${FAKEPATH}:${PATH}"

function setup-clean {
  rm -rf ${TESTTMP}
  mkdir ${TESTTMP}
}

function setup-script {
  echo '#!/bin/bash' > $2
  echo "$1" >> $2
  chmod +x $2
}

function die {
  printf "$1\n"
  exit 1
}
