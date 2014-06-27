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

   Docker has a dependency on kernel version 3.8. Ensure you are running version 3.8 or above before proceeding.


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
