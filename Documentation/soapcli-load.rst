soapcli-load
############

load wsdl definitions
---------------------

:Manual section: 1
:Date: 2017-08-02
:Author: Jan Matějka yac@blesmrt.net
:Manual group: soapcli manual

SYNOPSIS
========

soapcli load [-v] <glob> [<glob>...]

OPTIONS
=======

--verbose, -v    verbose output - display the output of gsoap commands

DESCRIPTION
===========

Load wsdl files matched by any of the <glob> to generate request templates
from.

If load fails, it is likely due to invalid wsdl files. Re-run the load in
verbose mode to see what gsoap has to say about it.

.. include:: common-see-also.rst
.. include:: common-foot.rst
