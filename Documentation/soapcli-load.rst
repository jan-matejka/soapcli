soapcli-load
############

laod wsdl definitions
---------------------

:Manual section: 1
:Date: 2017-07-10
:Author: Jan Matějka yac@blesmrt.net
:Manual group: soapcli manual

SYNOPSIS
========

soapcli load <file> [<file>...]

DESCRIPTION
===========

Load wsdl <file> to generate request templates from.

Note the wsdl files must be correct. The template generation actually
happens here but is difficult to detect when errors happen so the command
still ends successfully even when the generation went wrong.

.. include:: common-see-also.rst
.. include:: common-foot.rst
