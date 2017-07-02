soapcli-create
##############

create operation request template
---------------------------------

:Manual section: 1
:Date: 2017-07-10
:Author: Jan Matějka yac@blesmrt.net
:Manual group: soapcli manual

SYNOPSIS
========

soapcli create <binding>.<operation>

DESCRIPTION
===========

Creates a request template for <operation> in <binding> and prints it to
stdout.

Technically, the template is created during ``man 1 soapcli-load`` but
that may change and soapcli-create may be wrapped with application
specific request creator, see ``man 1 soapcli-call``.

.. include:: common-see-also.rst
.. include:: common-foot.rst
