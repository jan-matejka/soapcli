  $ . $TESTDIR/setup.zsh

Load by absolute path
=====================

  $ soapcli load $TESTDIR/wsdl/*
  $ soapcli operations
  StockQuoteSoapBinding.GetTradePrice
  StockQuoteSoapBinding.GetTradePrice2

Load by relative path
=====================

  $ setup-clean
  $ soapcli operations
  $ cd $TESTDIR
  $ soapcli load wsdl/*
  $ soapcli operations
  StockQuoteSoapBinding.GetTradePrice
  StockQuoteSoapBinding.GetTradePrice2

Load --verbose
==============

  $ fake -cv wsdl2h
  $ fake -cv soapcpp2
The output of wsdl2h and soapcpp2 is pretty anoying so we'll mock it here.
If we see here the fakes output, we'll see it with real ones too.

  $ soapcli load --verbose $TESTDIR/wsdl/* >$TESTTMP/out 2>&1
  $ soapcli load -v $TESTDIR/wsdl/* >$TESTTMP/out2 2>&1
  $ diff $TESTTMP/out $TESTTMP/out2
  $ cat $TESTTMP/out
  wsdl2h StockQuote.wsdl
  soapcpp2 StockQuote.h

Load glob
=========

  $ setup-clean
  $ soapcli operations
  $ cd $TESTDIR
  $ soapcli load 'wsdl/*'
  $ soapcli operations
  StockQuoteSoapBinding.GetTradePrice
  StockQuoteSoapBinding.GetTradePrice2

Reload
######

  $ setup-clean
  $ soapcli operations
  $ mkdir $TESTTMP/wsdl
  $ cp -a $TESTDIR/wsdl/* $TESTTMP/wsdl/
  $ cd $TESTTMP
  $ soapcli load 'wsdl/*xsd' $TESTTMP'/wsdl/*wsdl'
  $ soapcli operations
  StockQuoteSoapBinding.GetTradePrice
  StockQuoteSoapBinding.GetTradePrice2
  $ ls -1 wsdl
  StockQuote.wsdl
  StockQuote.xsd
  $ rm -r $(soapcli path xml-tpl)
  $ soapcli operations
  $ rename StockQuote FooBar wsdl/*wsdl
Have to rename only the wsdl since it includes the "StockQuote.xsd"
otherwise we would have to fix the include as well.

  $ ls -1 wsdl
  FooBar.wsdl
  StockQuote.xsd
  $ soapcli reload
  $ soapcli operations
  StockQuoteSoapBinding.GetTradePrice
  StockQuoteSoapBinding.GetTradePrice2

Reload is NOOP if no glob is saved
==================================

  $ cd /
  $ setup-clean
  $ fake -cv soapcli-load
  $ soapcli reload

Reload starting with ~
######################

  $ cd /
  $ setup-clean
  $ export HOME=$TESTTMP
  $ mkdir $TESTTMP/wsdl
  $ cp -a $TESTDIR/wsdl/* $TESTTMP/wsdl/
  $ soapcli load '~/wsdl/*'
  $ soapcli config load.globs
  /tmp/cramtests-*/01.load.t/wsdl/\* (glob)
