#!/usr/bin/env zsh

export TESTTMP="$CRAMTMP/$TESTFILE"

export FAKE_BINDIR="$TESTTMP/path"
mkdir $FAKE_BINDIR || return
export PATH="$FAKE_BINDIR:$PATH"

export XDG_CACHE_HOME=$TESTTMP/xdg-cache
export XDG_CONFIG_HOME=$TESTTMP/xdg-config

function setup-clean {
  rm -rf $TESTTMP
  mkdir $TESTTMP
}

function setup-script {
  local f=$FAKE_BINDIR/$2
  echo '#!/bin/bash' > $f
  echo "$1" >> $f
  chmod +x $f
}

function fake-curl {
  setup-script 'echo "${0##*/} $@" >&2; exec tee' curl
}

function die {
  printf "$1\n"
  exit 1
}
