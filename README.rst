=======
Docker
=======

Formula to install docker.

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/topics/conventions/formulas.html>`_.


Dependencies
============

.. note::

   Docker has a dependency on kernel version 3.8. This formula checks and upgrades 

   the kernel version, triggering a reboot of the server on completion.


Available states
================

.. contents::
    :local:

``init``
----------

Installs docker and starts the docker service.
This has been tested only on Ubuntu 12.04.

Example usage::

    include:
      - docker
