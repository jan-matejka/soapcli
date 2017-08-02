  $ . $TESTDIR/setup.zsh

Load by absolute path
=====================

  $ soapcli load $TESTDIR/StockQuote.wsdl
  $ soapcli operations
  StockQuoteSoapBinding.GetTradePrice
  StockQuoteSoapBinding.GetTradePrice2

Load by relative path
=====================

  $ setup-clean
  $ soapcli operations
  $ cd $TESTDIR
  $ soapcli load *wsdl
  $ soapcli operations
  StockQuoteSoapBinding.GetTradePrice
  StockQuoteSoapBinding.GetTradePrice2

Load --verbose
==============

  $ fake -cv wsdl2h
  $ fake -cv soapcpp2
The output of wsdl2h and soapcpp2 is pretty anoying so we'll mock it here.
If we see here the fakes output, we'll see it with real ones too.

  $ soapcli load --verbose $TESTDIR/StockQuote.wsdl >$TESTTMP/out 2>&1
  $ soapcli load -v $TESTDIR/StockQuote.wsdl >$TESTTMP/out2 2>&1
  $ diff $TESTTMP/out $TESTTMP/out2
  $ cat $TESTTMP/out
  wsdl2h StockQuote.wsdl
  soapcpp2 StockQuote.h
