  $ . $TESTDIR/setup.zsh
  $ soapcli config foo bar
  $ soapcli config foo
  bar

  $ soapcli config foo qux
  $ soapcli config foo
  qux
