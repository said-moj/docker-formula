{% from "docker/map.jinja" import docker with context %}
include:
  - python
  - .repo

docker-dependencies:
  pkg.installed:
    - pkgs:
      - pciutils
      - procps
      - ca-certificates
      - linux-image-extra-{{ salt['grains.get']('kernelrelease') }}

docker-pkg:
  pkg.installed:
    - name: {{ docker.pkg }}
    - version: {{ docker.pkg_version }}-0~{{ grains.lsb_distrib_codename }}
    - require:
      - pkg: docker-dependencies
      - pkgrepo: docker_repo
      - kmod: aufs

docker-py:
  pip.installed:
    - name: docker-py == {{ docker.py_version }}
    - reload_modules: True
    - require:
      - pkg: docker-pkg

/etc/default/docker:
  file.managed:
    - template: jinja
    - source: salt://docker/templates/docker/default
    - watch_in:
      - service: docker

docker:
  service.running:
    - require:
      - pkg: docker-pkg

aufs:
  kmod.present

