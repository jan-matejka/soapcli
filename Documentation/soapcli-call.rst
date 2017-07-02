soapcli-call
############

call a soap operation
---------------------

:Manual section: 1
:Date: 2017-07-10
:Author: Jan Matějka yac@blesmrt.net
:Manual group: soapcli manual

SYNOPSIS
========

soapcli call <binding>.<operation>

DESCRIPTION
===========

soapcli-call will

1. create a template for <operation> in <binding> using
   ``call.creator`` config option or ``man 1 soapcli-create`` if not set.

2. open the template in vim for editing. The vim may be exited with
   non-zero exit code to abort (``:cq``).

3. send the request using ``man 1 soapcli-send``.

4. open the received response in vim.

.. include:: common-see-also.rst
.. include:: common-foot.rst
