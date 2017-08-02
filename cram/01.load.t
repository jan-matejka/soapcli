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
