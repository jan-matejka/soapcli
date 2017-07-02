  $ . $TESTDIR/setup.zsh

  $ soapcli config endpoint example.com
  $ fake-curl

  $ echo "<foo></foo>" | soapcli send
  curl --header Content-Type: text/xml;charset=UTF-8 -d@- --silent --show-error example.com
  <?xml version="1.0"?>
  <foo/>

  $ soapcli config proxy poo
  $ echo "<foo></foo>" | soapcli send
  curl -x poo --header Content-Type: text/xml;charset=UTF-8 -d@- --silent --show-error example.com
  <?xml version="1.0"?>
  <foo/>
