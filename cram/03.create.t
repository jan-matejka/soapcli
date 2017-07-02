  $ . $TESTDIR/setup.zsh

  $ soapcli load $TESTDIR/StockQuote.wsdl

  $ soapcli create StockQuoteSoapBinding.GetTradePrice
  <?xml version="1.0" encoding="UTF-8"?>
  <SOAP-ENV:Envelope
    xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"
    xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema"
    xmlns:ns1="http://example.com/stockquote">
   <SOAP-ENV:Body  SOAP-ENV:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">
    <ns1:GetTradePrice>
     <xsd:string>   </xsd:string>
     <xsd:timeInstant>   </xsd:timeInstant>
    </ns1:GetTradePrice>
   </SOAP-ENV:Body>
  </SOAP-ENV:Envelope>
