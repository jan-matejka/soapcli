soapcli
#######

cli soap client
---------------

:Manual section: 1
:Date: 2017-07-10
:Author: Jan Matějka yac@blesmrt.net
:Manual group: soapcli manual

SYNOPSIS
========

soapcli [-x] <command> [<arg>...]

DESCRIPTION
===========

soapcli is a command line soap client.

OPTIONS
=======

-x    Enable XTRACE shell option for debugging.

COMMANDS
========

* ``man 1 soapcli-call``

* ``man 1 soapcli-config``

* ``man 1 soapcli-create``

* ``man 1 soapcli-load``

* ``man 1 soapcli-reload``

* ``man 1 soapcli-operations``

* ``man 1 soapcli-send``

EXAMPLES
========

First you need to load a wsdl::

  $ soapcli load MyFoo.wsdl

Then you can create request templates::

  $ soapcli create MyFoo.Bar

Or call them (send to endpoint after manual editing)::

  $ soapcli config endpoint http://example.com
  $ soapcli call MyFoo.Bar

Or send them in scripted way::

  $ soapcli create MyFoo.Bar | xml ed ... | soapcli send

INSTALLATION
============

make && make check && make install

DEPENDENCIES
============


Build:

* python-docutils

* GNU make

Tests:

* ``cram <https://github.com/brodie/cram>``

Runtime:

* zsh

* coreutils (mktemp, cat)

* vim

* gsoap (wsdl2h, soapcpp2)

* curl

* libxml2 (xmllint)

* ``xdgenv <https://github.com/yaccz/xdgenv>``

* findutils

.. include:: common-foot.rst
