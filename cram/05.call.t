  $ . $TESTDIR/setup.zsh

  $ soapcli config endpoint example.com
  $ setup-script 'echo "<foo></foo>"' soapcli-create
  $ setup-script 'echo vim $1 >> '"$TESTTMP/log;"'cat $1 >> '"$TESTTMP/log" vim
  $ setup-script "echo 'soapcli-send' >> $TESTTMP/log; exec tee -a $TESTTMP/log | sed 's/foo/bar/g'" soapcli-send

  $ setup-load-stock-quote
  $ soapcli call StockQuoteSoapBinding.GetTradePrice
  $ cat $TESTTMP/log
  vim /tmp/cramtests-????????/tmp/tmp.?????????? (glob)
  <foo></foo>
  soapcli-send
  <foo></foo>
  vim /tmp/cramtests-????????/tmp/tmp.?????????? (glob)
  <bar></bar>
