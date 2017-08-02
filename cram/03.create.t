  $ . $TESTDIR/setup.zsh

  $ setup-load-stock-quote
  $ soapcli create StockQuoteSoapBinding.GetTradePrice
  <?xml version="1.0" encoding="UTF-8"?>
  <SOAP-ENV:Envelope
    xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"
    xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema"
    xmlns:ns1="http://example.com/stockquote.wsdl"
    xmlns:ns2="http://example.com/stockquote">
   <SOAP-ENV:Body  SOAP-ENV:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">
    <ns2:GetTradePrice>
     <ns1:TradePrice>
      <ticker></ticker>
      <time></time>
     </ns1:TradePrice>
    </ns2:GetTradePrice>
   </SOAP-ENV:Body>
  </SOAP-ENV:Envelope>
